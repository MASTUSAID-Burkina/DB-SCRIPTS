delete from la_ext_attributemaster where attributecategoryid = 15;
delete from public.la_ext_attributecategory where attributecategoryid = 15;
update public.la_ext_rolemodulemapping set isactive = 't' where moduleid = 14;

update public.la_ext_workflowactionmapping set actionname = 'Valider' where actionname_en like 'Approve%';
update public.la_ext_workflowactionmapping set actionname = 'Modifier les attributs' where actionname_en like 'Edit Attributes%';
update public.la_ext_workflowactionmapping set actionname = 'Modification N° et Validation' where actionname_en like 'Edit Parcel Number%';
update public.la_ext_workflowactionmapping set actionname = 'Créer  les formulaires' where actionname_en like 'Generate Forms%';
update public.la_ext_workflowactionmapping set actionname = 'Créer  plans' where actionname_en like 'Generate Map%';
update public.la_ext_workflowactionmapping set actionname = 'Info payement' where actionname_en like 'Payment Info%';
update public.la_ext_workflowactionmapping set actionname = 'Rejeter (Defavorable)' where actionname_en like 'Reject%';
update public.la_ext_workflowactionmapping set actionname = 'Info signature' where actionname_en like 'Signatory Info%';
update public.la_ext_workflowactionmapping set actionname = 'Visualiser les attributs' where actionname_en like 'View Attributes%';
update public.la_ext_workflowactionmapping set actionname = 'Visualiser le plan' where actionname_en like 'View Map%';
update public.la_ext_workflowactionmapping set actionname = 'Visualisere le numéro parcellaire' where actionname_en like 'View Parcel Number%';

update public.la_ext_process set processname = 'Transfert de Terre' where processid = 2;

ALTER TABLE public.la_spatialunit_resource_land ADD COLUMN chartered boolean NOT NULL DEFAULT 'f';
ALTER TABLE public.la_spatialunit_resource_land ADD COLUMN comment character varying(1000);
ALTER TABLE public.la_spatialunit_resource_land ADD COLUMN validated_by_council boolean;
ALTER TABLE public.la_spatialunit_resource_land ADD COLUMN validation_date date;
ALTER TABLE public.la_spatialunit_resource_land ADD COLUMN in_exploitation boolean;

ALTER TABLE public.la_spatialunit_resource_line ADD COLUMN chartered boolean NOT NULL DEFAULT 'f';
ALTER TABLE public.la_spatialunit_resource_line ADD COLUMN comment character varying(1000);
ALTER TABLE public.la_spatialunit_resource_line ADD COLUMN validated_by_council boolean;
ALTER TABLE public.la_spatialunit_resource_line ADD COLUMN validation_date date;
ALTER TABLE public.la_spatialunit_resource_line ADD COLUMN in_exploitation boolean;

ALTER TABLE public.la_spatialunit_resource_point ADD COLUMN chartered boolean NOT NULL DEFAULT 'f';
ALTER TABLE public.la_spatialunit_resource_point ADD COLUMN comment character varying(1000);
ALTER TABLE public.la_spatialunit_resource_point ADD COLUMN validated_by_council boolean;
ALTER TABLE public.la_spatialunit_resource_point ADD COLUMN validation_date date;
ALTER TABLE public.la_spatialunit_resource_point ADD COLUMN in_exploitation boolean;

delete from la_ext_surveyprojectattributes where attributemasterid in (1012,1013,1011,1014,1170);
delete from la_ext_attributemaster where attributemasterid in (1012,1013,1011,1014,1170);
