UPDATE public.la_ext_grouptype SET grouptype='ONG, Associations', grouptype_en='NGOs, Associations' WHERE grouptypeid = 1;
UPDATE public.la_ext_grouptype SET grouptype='Collectivités territoriales', grouptype_en='Territorial collectivities' WHERE grouptypeid = 2;
UPDATE public.la_ext_grouptype SET grouptype='Entreprise commerciale', grouptype_en='Commercial enterprise' WHERE grouptypeid = 3;
UPDATE public.la_ext_grouptype SET grouptype='Service technique de l''ETAT', grouptype_en='Technical service of the State' WHERE grouptypeid = 4;

DELETE FROM public.la_ext_grouptype WHERE grouptypeid > 4;

DROP TABLE public.la_party_organization;

CREATE TABLE public.la_party_organization
(
  organizationid bigint NOT NULL,
  organizationname character varying(100) NOT NULL,
  spatialunitgroupid1 integer NOT NULL,
  hierarchyid1 integer NOT NULL,
  spatialunitgroupid2 integer NOT NULL,
  hierarchyid2 integer NOT NULL,
  spatialunitgroupid3 integer NOT NULL,
  hierarchyid3 integer NOT NULL,
  spatialunitgroupid4 integer,
  hierarchyid4 integer,
  spatialunitgroupid5 integer,
  hierarchyid5 integer,
  spatialunitgroupid6 integer,
  hierarchyid6 integer,
  identitytypeid integer,
  identityregistrationno character varying(250),
  contactno character varying(15),
  faxno character varying(15),
  emailid character varying(50),
  website character varying(50),
  grouptypeid integer NOT NULL,
  isactive boolean NOT NULL DEFAULT true,
  createdby integer NOT NULL,
  createddate timestamp without time zone NOT NULL,
  modifiedby integer,
  modifieddate timestamp without time zone,
  address character varying(500),
  repname character varying(500),
  regdate date,
  CONSTRAINT pk_la_party_organization PRIMARY KEY (organizationid),
  CONSTRAINT fk_la_party_organization_grouptypeid FOREIGN KEY (grouptypeid)
      REFERENCES public.la_ext_grouptype (grouptypeid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_hierarchyid1 FOREIGN KEY (hierarchyid1)
      REFERENCES public.la_spatialunitgroup_hierarchy (hierarchyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_hierarchyid2 FOREIGN KEY (hierarchyid2)
      REFERENCES public.la_spatialunitgroup_hierarchy (hierarchyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_hierarchyid3 FOREIGN KEY (hierarchyid3)
      REFERENCES public.la_spatialunitgroup_hierarchy (hierarchyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_hierarchyid4 FOREIGN KEY (hierarchyid4)
      REFERENCES public.la_spatialunitgroup_hierarchy (hierarchyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_hierarchyid5 FOREIGN KEY (hierarchyid5)
      REFERENCES public.la_spatialunitgroup_hierarchy (hierarchyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_identitytypeid FOREIGN KEY (identitytypeid)
      REFERENCES public.la_partygroup_identitytype (identitytypeid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_organizationid FOREIGN KEY (organizationid)
      REFERENCES public.la_party (partyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_spatialunitgroupid1 FOREIGN KEY (spatialunitgroupid1)
      REFERENCES public.la_spatialunitgroup (spatialunitgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_spatialunitgroupid2 FOREIGN KEY (spatialunitgroupid2)
      REFERENCES public.la_spatialunitgroup (spatialunitgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_spatialunitgroupid3 FOREIGN KEY (spatialunitgroupid3)
      REFERENCES public.la_spatialunitgroup (spatialunitgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_spatialunitgroupid4 FOREIGN KEY (spatialunitgroupid4)
      REFERENCES public.la_spatialunitgroup (spatialunitgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_party_organization_spatialunitgroupid5 FOREIGN KEY (spatialunitgroupid5)
      REFERENCES public.la_spatialunitgroup (spatialunitgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_spatialunit_land_hierarchyid6 FOREIGN KEY (hierarchyid1)
      REFERENCES public.la_spatialunitgroup_hierarchy (hierarchyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_la_spatialunit_land_spatialunitgroupid6 FOREIGN KEY (spatialunitgroupid1)
      REFERENCES public.la_spatialunitgroup (spatialunitgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.la_party_organization
  OWNER TO postgres;
GRANT ALL ON TABLE public.la_party_organization TO postgres;

INSERT INTO public.la_right_landsharetype(landsharetypeid, landsharetype, landsharetype_en, isactive) VALUES (9,'Collectif - Personne morale','Collective - Moral entity',TRUE);

ALTER TABLE public.la_ext_permission DROP CONSTRAINT fk_applicant;
ALTER TABLE public.la_ext_permission DROP CONSTRAINT fk_owner;

ALTER TABLE public.la_ext_permission ADD CONSTRAINT fk_applicant FOREIGN KEY (applicantid)
      REFERENCES public.la_party (partyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE public.la_ext_permission ADD CONSTRAINT fk_owner FOREIGN KEY (ownerid)
      REFERENCES public.la_party (partyid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

CREATE OR REPLACE FUNCTION public.updatearea()
  RETURNS trigger AS
$BODY$
BEGIN

IF (select st_equals(new.geometry,old.geometry) FROM la_spatialunit_land where landid=new.landid) ='False' Then
update la_spatialunit_land set Area=ST_Area(geometry) Where LandID=new.LandID;

  END IF;

RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.updatearea()
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.update_area()
  RETURNS trigger AS
$BODY$BEGIN

 IF Exists (select landid from la_spatialunit_land Where oldLandID=new.OLDLandID) THEN
update la_spatialunit_land set Area=  ST_Area(geometry)
 Where oldLandID=new.OLDLandID and landid in(select landid from la_spatialunit_land Where oldLandID=new.OLDLandID);
   
END IF;

RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.update_area()
  OWNER TO postgres;