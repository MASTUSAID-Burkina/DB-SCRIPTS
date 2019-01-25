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

update public.la_ext_attributemaster set fieldaliasname = 'Date de mandate' where attributemasterid=294;

UPDATE public.la_ext_attributecategory set categoryname = 'Publique' where attributecategoryid = 13;
UPDATE public.la_ext_attributecategory set categoryname = 'Privé (individuel)' where attributecategoryid = 10;
UPDATE public.la_ext_attributecategory set categoryname = 'Privé (conjointement)' where attributecategoryid = 17;
UPDATE public.la_ext_attributecategory set categoryname = 'Organisation (informelle)' where attributecategoryid = 18;
UPDATE public.la_ext_attributecategory set categoryname = 'Organisation (formelle)' where attributecategoryid = 14;
UPDATE public.la_ext_attributecategory set categoryname = 'Communautaire' where attributecategoryid = 12;
UPDATE public.la_ext_attributecategory set categoryname = 'Collectif' where attributecategoryid = 11;
UPDATE public.la_ext_attributecategory set categoryname = 'Ouvert' where attributecategoryid = 9;

UPDATE public.la_ext_resourceclassification set classificationname = 'Terre agricole' where classificationid = 4;
UPDATE public.la_ext_resourceclassification set classificationname = 'Terre stérile' where classificationid = 6;
UPDATE public.la_ext_resourceclassification set classificationname = 'Zone bâtie' where classificationid = 1;
UPDATE public.la_ext_resourceclassification set classificationname = 'Installations communautaires - Ligne' where classificationid = 2;
UPDATE public.la_ext_resourceclassification set classificationname = 'Installations communautaires - Point' where classificationid = 3;
UPDATE public.la_ext_resourceclassification set classificationname = 'Zones culturelles / économiques / protégées' where classificationid = 7;
UPDATE public.la_ext_resourceclassification set classificationname = 'Forêt-bois' where classificationid = 5;
UPDATE public.la_ext_resourceclassification set classificationname = 'Eau' where classificationid = 9;
UPDATE public.la_ext_resourceclassification set classificationname = 'Zone humide' where classificationid = 8;

UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Non urbain' where subclassificationid = 2;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Urbain' where subclassificationid = 1;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Chemin' where subclassificationid = 4;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Route' where subclassificationid = 3;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Pont' where subclassificationid = 5;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Immeubles' where subclassificationid = 6;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Eglises, Mosquées' where subclassificationid = 7;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Clinique' where subclassificationid = 9;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Réunion de la communauté' where subclassificationid = 10;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Marché' where subclassificationid = 11;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Autres' where subclassificationid = 12;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'École' where subclassificationid = 8;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Agroforesterie' where subclassificationid = 17;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Aquaculture' where subclassificationid = 18;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Grazing lands- pastures (stationary)' where subclassificationid = 15;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Pâturage-pastoralisme' where subclassificationid = 16;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Agriculture irriguée de petites parcelles' where subclassificationid = 14;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Agriculture de petites parcelles pluviale' where subclassificationid = 13;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Forêt mixte' where subclassificationid = 20;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Forêt naturelle' where subclassificationid = 19;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Bois ouvert' where subclassificationid = 21;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Les parcs' where subclassificationid = 22;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Roche nue' where subclassificationid = 23;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Autres' where subclassificationid = 26;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Sable ou Désert ou Plaine' where subclassificationid = 24;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Légèrement végétalisé' where subclassificationid = 25;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Zones Culturelles' where subclassificationid = 32;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Zones de pêche' where subclassificationid = 29;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Zones de chasse et de cueillette' where subclassificationid = 28;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Sites miniers' where subclassificationid = 27;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Zones protégées / de conservation' where subclassificationid = 31;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Zones fauniques' where subclassificationid = 30;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Végétation des terres humides côtières' where subclassificationid = 34;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Forêt côtière' where subclassificationid = 35;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Végétation des terres humides' where subclassificationid = 33;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Lagune, Lac' where subclassificationid = 39;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Mer et océan' where subclassificationid = 40;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Plans d''eau' where subclassificationid = 38;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Cours d''eau rivière' where subclassificationid = 36;
UPDATE public.la_ext_resourcesubclassification set subclassificationname = 'Cours d''eau' where subclassificationid = 37;


