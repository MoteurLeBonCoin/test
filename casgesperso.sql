/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  27/07/2016 15:41:00                      */
/*==============================================================*/


alter table E_CLIENT
   drop constraint FK_E_CLIENT_R_CARACTE_E_DOMAIN;

alter table E_CLIENT
   drop constraint FK_E_CLIENT_R_DOMICIL_E_ADRESS;

alter table E_COLLABORATEUR
   drop constraint FK_E_COLLAB_R_ACCUEIL_E_COLLAB;

alter table E_COLLABORATEUR
   drop constraint FK_E_COLLAB_R_RESIDER_E_ADRESS;

alter table E_CONTACT
   drop constraint FK_E_CONTAC_R_AGIR_E_CLIENT;

alter table E_CONTRAT
   drop constraint FK_E_CONTRA_R_AVOIR_E_COLLAB;

alter table E_DESCRIPTION
   drop constraint FK_E_DESCRI_R_DECRIRE_E_TECHNO;

alter table E_DOCUMENT
   drop constraint FK_E_DOCUME_R_EDITER_E_COLLAB;

alter table E_DOCUMENT
   drop constraint FK_E_DOCUME_R_INDIQUE_E_PROJET;

alter table E_ETAPE
   drop constraint FK_E_ETAPE_R_PARTICI_E_PROJET;

alter table E_FONCTION
   drop constraint FK_E_FONCTI_R_POSSEDE_E_COLLAB;

alter table E_INTERVENTION
   drop constraint FK_E_INTERV_R_EFFECTU_E_COLLAB;

alter table E_INTERVENTION
   drop constraint FK_E_INTERV_R_INTERVE_E_ETAPE;

alter table E_INTERVENTION
   drop constraint FK_E_INTERV_R_REALISE_E_FONCTI;

alter table E_PROJET
   drop constraint FK_E_PROJET_R_CONTACT_E_CONTAC;

alter table E_PROJET
   drop constraint FK_E_PROJET_R_INITIAL_E_COLLAB;

alter table E_PROJET
   drop constraint FK_E_PROJET_R_NOTIFIE_E_PHASE_;

alter table E_PROJET
   drop constraint FK_E_PROJET_R_PRECISE_E_SECTEU;

alter table E_PROJET
   drop constraint FK_E_PROJET_R_QUALIFI_E_TYPE_P;

alter table E_PROJET
   drop constraint FK_E_PROJET_R_VENDRE_E_CLIENT;

alter table E_SALAIRE
   drop constraint FK_E_SALAIR_R_DETIENT_E_COLLAB;

alter table R_INFORMER
   drop constraint FK_R_INFORM_R_INFORME_E_PROJET;

alter table R_INFORMER
   drop constraint FK_R_INFORM_R_INFORME_E_TECHNO;

drop table E_ADRESSE cascade constraints;

drop index R_CARACTERISER_FK;

drop index R_DOMICILIER_FK;

drop table E_CLIENT cascade constraints;

drop index R_RESIDER_FK;

drop index R_ACCUEILLIR_FK;

drop table E_COLLABORATEUR cascade constraints;

drop index R_AGIR_FK;

drop table E_CONTACT cascade constraints;

drop index R_AVOIR_FK;

drop table E_CONTRAT cascade constraints;

drop index R_DECRIRE_FK;

drop table E_DESCRIPTION cascade constraints;

drop index R_EDITER_FK;

drop index R_INDIQUER_FK;

drop table E_DOCUMENT cascade constraints;

drop table E_DOMAINE_ACTIVITE cascade constraints;

drop index R_PARTICIPER_FK;

drop table E_ETAPE cascade constraints;

drop index R_POSSEDER_FK;

drop table E_FONCTION cascade constraints;

drop index R_REALISER_FK;

drop index R_INTERVENIR_FK;

drop index R_EFFECTUER_FK;

drop table E_INTERVENTION cascade constraints;

drop table E_PHASE_CYCLE_VIE cascade constraints;

drop index R_VENDRE_FK;

drop index R_PRECISER_FK;

drop index R_QUALIFIER_FK;

drop index R_NOTIFIER_FK;

drop index R_CONTACTER_FK;

drop index R_INITIALISER_FK;

drop table E_PROJET cascade constraints;

drop index R_DETIENT_FK;

drop table E_SALAIRE cascade constraints;

drop table E_SECTEUR_ACTIVITE cascade constraints;

drop table E_TECHNOLOGIE cascade constraints;

drop table E_TYPE_PROJET cascade constraints;

drop index R_INFORMER2_FK;

drop index R_INFORMER_FK;

drop table R_INFORMER cascade constraints;

drop sequence S_E_ADRESSE;

drop sequence S_E_CONTACT;

drop sequence S_E_CONTRAT;

drop sequence S_E_DOCUMENT;

drop sequence S_E_DOMAINE_ACTIVITE;

drop sequence S_E_FONCTION;

drop sequence S_E_INTERVENTION;

drop sequence S_E_PHASE_CYCLE_VIE;

drop sequence S_E_SALAIRE;

drop sequence S_E_SECTEUR_ACTIVITE;

drop sequence S_E_TYPE_PROJET;

create sequence S_E_ADRESSE;

create sequence S_E_CONTACT;

create sequence S_E_CONTRAT;

create sequence S_E_DOCUMENT;

create sequence S_E_DOMAINE_ACTIVITE;

create sequence S_E_FONCTION;

create sequence S_E_INTERVENTION;

create sequence S_E_PHASE_CYCLE_VIE;

create sequence S_E_SALAIRE;

create sequence S_E_SECTEUR_ACTIVITE;

create sequence S_E_TYPE_PROJET;

/*==============================================================*/
/* Table : E_ADRESSE                                            */
/*==============================================================*/
create table E_ADRESSE 
(
   ADRESSE_ID           NUMBER(6)            not null,
   ADRESSE_ADRESSE1     CHAR(25)             not null,
   ADRESSE_ADRESSE2     CHAR(25),
   ADRESSE_CP           CHAR(5)              not null,
   ADRESSE_VILLE        CHAR(30)             not null,
   constraint PK_E_ADRESSE primary key (ADRESSE_ID)
);

/*==============================================================*/
/* Table : E_CLIENT                                             */
/*==============================================================*/
create table E_CLIENT 
(
   CLIENT_ID            CHAR(4)              not null,
   DOMAINE_ACTIVITE_ID  NUMBER(6)            not null,
   ADRESSE_ID           NUMBER(6),
   CLIENT_CA            NUMBER               not null,
   CLIENT_COMMENTAIRE   CHAR(100),
   CLIENT_EFFECTIF      NUMBER               not null,
   CLIENT_NATURE        CHAR(10)             not null,
   CLIENT_RAISON_SOCIALE CHAR(100)            not null,
   CLIENT_TELEPHONE     CHAR(10)             not null,
   CLIENT_TYPE          CHAR(1)              not null,
   constraint PK_E_CLIENT primary key (CLIENT_ID)
);

/*==============================================================*/
/* Index : R_DOMICILIER_FK                                      */
/*==============================================================*/
create index R_DOMICILIER_FK on E_CLIENT (
   ADRESSE_ID ASC
);

/*==============================================================*/
/* Index : R_CARACTERISER_FK                                    */
/*==============================================================*/
create index R_CARACTERISER_FK on E_CLIENT (
   DOMAINE_ACTIVITE_ID ASC
);

/*==============================================================*/
/* Table : E_COLLABORATEUR                                      */
/*==============================================================*/
create table E_COLLABORATEUR 
(
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   ADRESSE_ID           NUMBER(6),
   E_C_COLLABORATEUR_MATRICULE NUMBER(4),
   COLLABORATEUR_DATE_ENTREE DATE                 not null,
   COLLABORATEUR_DATE_NAISSANCE DATE                 not null,
   COLLABORATEUR_DATE_SORTIE DATE,
   COLLABORATEUR_ETAT_CIVIL CHAR(3)              not null,
   COLLABORATEUR_NOM    CHAR(20)             not null,
   COLLABORATEUR_PRENOM CHAR(20)             not null,
   COLLABORATEUR_SEXE   CHAR(1)              not null,
   COLLABORATEUR_TELEPHONE CHAR(10),
   constraint PK_E_COLLABORATEUR primary key (COLLABORATEUR_MATRICULE)
);

/*==============================================================*/
/* Index : R_ACCUEILLIR_FK                                      */
/*==============================================================*/
create index R_ACCUEILLIR_FK on E_COLLABORATEUR (
   E_C_COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Index : R_RESIDER_FK                                         */
/*==============================================================*/
create index R_RESIDER_FK on E_COLLABORATEUR (
   ADRESSE_ID ASC
);

/*==============================================================*/
/* Table : E_CONTACT                                            */
/*==============================================================*/
create table E_CONTACT 
(
   CONTACT_ID           NUMBER(6)            not null,
   CLIENT_ID            CHAR(4)              not null,
   CONTACT_FONCTION     CHAR(50)             not null,
   CONTACT_NOM          CHAR(20)             not null,
   constraint PK_E_CONTACT primary key (CONTACT_ID)
);

/*==============================================================*/
/* Index : R_AGIR_FK                                            */
/*==============================================================*/
create index R_AGIR_FK on E_CONTACT (
   CLIENT_ID ASC
);

/*==============================================================*/
/* Table : E_CONTRAT                                            */
/*==============================================================*/
create table E_CONTRAT 
(
   CONTRAT_ID           NUMBER(6)            not null,
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   CONTRAT_TYPE         CHAR(3)              not null,
   CONTRAT_DATE_DEBUT   DATE                 not null,
   CONTRAT_DATE_FIN     DATE,
   constraint PK_E_CONTRAT primary key (CONTRAT_ID)
);

/*==============================================================*/
/* Index : R_AVOIR_FK                                           */
/*==============================================================*/
create index R_AVOIR_FK on E_CONTRAT (
   COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Table : E_DESCRIPTION                                        */
/*==============================================================*/
create table E_DESCRIPTION 
(
   DESCRIPTION_ID       INTEGER              not null,
   TECHNOLOGIE_ID       INTEGER              not null,
   DESCRIPTION_LIBELLE  CHAR(25)             not null,
   constraint PK_E_DESCRIPTION primary key (DESCRIPTION_ID)
);

/*==============================================================*/
/* Index : R_DECRIRE_FK                                         */
/*==============================================================*/
create index R_DECRIRE_FK on E_DESCRIPTION (
   TECHNOLOGIE_ID ASC
);

/*==============================================================*/
/* Table : E_DOCUMENT                                           */
/*==============================================================*/
create table E_DOCUMENT 
(
   DOCUMENT_ID          NUMBER(6)            not null,
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   PROJET_ID            CHAR(4)              not null,
   DOCUMENT_DATE_DIFFUSION DATE                 not null,
   DOCUMENT_RESUME      CHAR(100)            not null,
   DOCUMENT_TITRE       CHAR(100)            not null,
   constraint PK_E_DOCUMENT primary key (DOCUMENT_ID)
);

/*==============================================================*/
/* Index : R_INDIQUER_FK                                        */
/*==============================================================*/
create index R_INDIQUER_FK on E_DOCUMENT (
   PROJET_ID ASC
);

/*==============================================================*/
/* Index : R_EDITER_FK                                          */
/*==============================================================*/
create index R_EDITER_FK on E_DOCUMENT (
   COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Table : E_DOMAINE_ACTIVITE                                   */
/*==============================================================*/
create table E_DOMAINE_ACTIVITE 
(
   DOMAINE_ACTIVITE_ID  NUMBER(6)            not null,
   DOMAINE_ACTIVITE_LIBELLE CHAR(100)            not null,
   constraint PK_E_DOMAINE_ACTIVITE primary key (DOMAINE_ACTIVITE_ID)
);

/*==============================================================*/
/* Table : E_ETAPE                                              */
/*==============================================================*/
create table E_ETAPE 
(
   ETAPE_ID             NUMBER(6)            not null,
   PROJET_ID            CHAR(4)              not null,
   ETAPE_CHARGE_ESTIMEE INTEGER              not null,
   ETAPE_CHARGE_PRODUCTION INTEGER              not null,
   ETAPE_CHARGE_VALIDATION INTEGER              not null,
   ETAPE_LIBELLE        CHAR(50)             not null,
   ETAPE_DATE_DEBUT     DATE                 not null,
   ETAPE_DATE_FIN       DATE                 not null,
   constraint PK_E_ETAPE primary key (ETAPE_ID)
);

/*==============================================================*/
/* Index : R_PARTICIPER_FK                                      */
/*==============================================================*/
create index R_PARTICIPER_FK on E_ETAPE (
   PROJET_ID ASC
);

/*==============================================================*/
/* Table : E_FONCTION                                           */
/*==============================================================*/
create table E_FONCTION 
(
   FONCTION_ID          NUMBER(6)            not null,
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   FONCTION_DATE_DEBUT  DATE                 not null,
   FONCTION_LIBELLE     CHAR(15)             not null,
   constraint PK_E_FONCTION primary key (FONCTION_ID)
);

/*==============================================================*/
/* Index : R_POSSEDER_FK                                        */
/*==============================================================*/
create index R_POSSEDER_FK on E_FONCTION (
   COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Table : E_INTERVENTION                                       */
/*==============================================================*/
create table E_INTERVENTION 
(
   INTERVENTION_ID      NUMBER(6)            not null,
   FONCTION_ID          NUMBER(6),
   ETAPE_ID             NUMBER(6),
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   INTERVENTION_DATE_DEBUT DATE                 not null,
   INTERVENTION_DATE_FIN DATE                 not null,
   constraint PK_E_INTERVENTION primary key (INTERVENTION_ID)
);

/*==============================================================*/
/* Index : R_EFFECTUER_FK                                       */
/*==============================================================*/
create index R_EFFECTUER_FK on E_INTERVENTION (
   COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Index : R_INTERVENIR_FK                                      */
/*==============================================================*/
create index R_INTERVENIR_FK on E_INTERVENTION (
   ETAPE_ID ASC
);

/*==============================================================*/
/* Index : R_REALISER_FK                                        */
/*==============================================================*/
create index R_REALISER_FK on E_INTERVENTION (
   FONCTION_ID ASC
);

/*==============================================================*/
/* Table : E_PHASE_CYCLE_VIE                                    */
/*==============================================================*/
create table E_PHASE_CYCLE_VIE 
(
   CYCLE_VIE_ID         NUMBER(6)            not null,
   CYCLE_VIE_LIBELLE    CHAR(20)             not null,
   constraint PK_E_PHASE_CYCLE_VIE primary key (CYCLE_VIE_ID)
);

/*==============================================================*/
/* Table : E_PROJET                                             */
/*==============================================================*/
create table E_PROJET 
(
   PROJET_ID            CHAR(4)              not null,
   CYCLE_VIE_ID         NUMBER(6)            not null,
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   SECTEUR_ACTIVITE_ID  NUMBER(6)            not null,
   TYPE_PROJET_ID       NUMBER(6)            not null,
   CONTACT_ID           NUMBER(6)            not null,
   CLIENT_ID            CHAR(4)              not null,
   PROJET_CHARGE_ESTIMEE NUMBER               not null,
   PROJET_COMMENTAIRE   CHAR(100),
   PROJET_DATE_PREV_DEBUT DATE                 not null,
   PROJET_DATE_PREV_FIN DATE                 not null,
   PROJET_DATE_REELLE_DEBUT DATE,
   PROJET_DATE_REELLE_FIN DATE,
   PROJET_INFORMATION_TECHNIQUE CHAR(100),
   PROJET_LIBELLE_COURT CHAR(10)             not null,
   PROJET_LIBELLE_LONG  CHAR(50)             not null,
   PROJET_NOMBRE_COLLAB NUMBER               not null,
   constraint PK_E_PROJET primary key (PROJET_ID)
);

/*==============================================================*/
/* Index : R_INITIALISER_FK                                     */
/*==============================================================*/
create index R_INITIALISER_FK on E_PROJET (
   COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Index : R_CONTACTER_FK                                       */
/*==============================================================*/
create index R_CONTACTER_FK on E_PROJET (
   CONTACT_ID ASC
);

/*==============================================================*/
/* Index : R_NOTIFIER_FK                                        */
/*==============================================================*/
create index R_NOTIFIER_FK on E_PROJET (
   CYCLE_VIE_ID ASC
);

/*==============================================================*/
/* Index : R_QUALIFIER_FK                                       */
/*==============================================================*/
create index R_QUALIFIER_FK on E_PROJET (
   TYPE_PROJET_ID ASC
);

/*==============================================================*/
/* Index : R_PRECISER_FK                                        */
/*==============================================================*/
create index R_PRECISER_FK on E_PROJET (
   SECTEUR_ACTIVITE_ID ASC
);

/*==============================================================*/
/* Index : R_VENDRE_FK                                          */
/*==============================================================*/
create index R_VENDRE_FK on E_PROJET (
   CLIENT_ID ASC
);

/*==============================================================*/
/* Table : E_SALAIRE                                            */
/*==============================================================*/
create table E_SALAIRE 
(
   SALAIRE_ID           NUMBER(6)            not null,
   COLLABORATEUR_MATRICULE NUMBER(4)            not null,
   SALAIRE_DATE         DATE                 not null,
   SALAIRE_MONTANT_BASE NUMBER               not null,
   constraint PK_E_SALAIRE primary key (SALAIRE_ID)
);

/*==============================================================*/
/* Index : R_DETIENT_FK                                         */
/*==============================================================*/
create index R_DETIENT_FK on E_SALAIRE (
   COLLABORATEUR_MATRICULE ASC
);

/*==============================================================*/
/* Table : E_SECTEUR_ACTIVITE                                   */
/*==============================================================*/
create table E_SECTEUR_ACTIVITE 
(
   SECTEUR_ACTIVITE_ID  NUMBER(6)            not null,
   SECTEUR_ACTIVITE_LIBELLE CHAR(50)             not null,
   constraint PK_E_SECTEUR_ACTIVITE primary key (SECTEUR_ACTIVITE_ID)
);

/*==============================================================*/
/* Table : E_TECHNOLOGIE                                        */
/*==============================================================*/
create table E_TECHNOLOGIE 
(
   TECHNOLOGIE_ID       INTEGER              not null,
   TECHNOLOGIE_TYPE     CHAR(25)             not null,
   constraint PK_E_TECHNOLOGIE primary key (TECHNOLOGIE_ID)
);

/*==============================================================*/
/* Table : E_TYPE_PROJET                                        */
/*==============================================================*/
create table E_TYPE_PROJET 
(
   TYPE_PROJET_ID       NUMBER(6)            not null,
   TYPE_PROJET_LIBELLE  CHAR(50)             not null,
   constraint PK_E_TYPE_PROJET primary key (TYPE_PROJET_ID)
);

/*==============================================================*/
/* Table : R_INFORMER                                           */
/*==============================================================*/
create table R_INFORMER 
(
   PROJET_ID            CHAR(4)              not null,
   TECHNOLOGIE_ID       INTEGER              not null,
   constraint PK_R_INFORMER primary key (PROJET_ID, TECHNOLOGIE_ID)
);

/*==============================================================*/
/* Index : R_INFORMER_FK                                        */
/*==============================================================*/
create index R_INFORMER_FK on R_INFORMER (
   PROJET_ID ASC
);

/*==============================================================*/
/* Index : R_INFORMER2_FK                                       */
/*==============================================================*/
create index R_INFORMER2_FK on R_INFORMER (
   TECHNOLOGIE_ID ASC
);

alter table E_CLIENT
   add constraint FK_E_CLIENT_R_CARACTE_E_DOMAIN foreign key (DOMAINE_ACTIVITE_ID)
      references E_DOMAINE_ACTIVITE (DOMAINE_ACTIVITE_ID);

alter table E_CLIENT
   add constraint FK_E_CLIENT_R_DOMICIL_E_ADRESS foreign key (ADRESSE_ID)
      references E_ADRESSE (ADRESSE_ID);

alter table E_COLLABORATEUR
   add constraint FK_E_COLLAB_R_ACCUEIL_E_COLLAB foreign key (E_C_COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table E_COLLABORATEUR
   add constraint FK_E_COLLAB_R_RESIDER_E_ADRESS foreign key (ADRESSE_ID)
      references E_ADRESSE (ADRESSE_ID);

alter table E_CONTACT
   add constraint FK_E_CONTAC_R_AGIR_E_CLIENT foreign key (CLIENT_ID)
      references E_CLIENT (CLIENT_ID);

alter table E_CONTRAT
   add constraint FK_E_CONTRA_R_AVOIR_E_COLLAB foreign key (COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table E_DESCRIPTION
   add constraint FK_E_DESCRI_R_DECRIRE_E_TECHNO foreign key (TECHNOLOGIE_ID)
      references E_TECHNOLOGIE (TECHNOLOGIE_ID);

alter table E_DOCUMENT
   add constraint FK_E_DOCUME_R_EDITER_E_COLLAB foreign key (COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table E_DOCUMENT
   add constraint FK_E_DOCUME_R_INDIQUE_E_PROJET foreign key (PROJET_ID)
      references E_PROJET (PROJET_ID);

alter table E_ETAPE
   add constraint FK_E_ETAPE_R_PARTICI_E_PROJET foreign key (PROJET_ID)
      references E_PROJET (PROJET_ID);

alter table E_FONCTION
   add constraint FK_E_FONCTI_R_POSSEDE_E_COLLAB foreign key (COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table E_INTERVENTION
   add constraint FK_E_INTERV_R_EFFECTU_E_COLLAB foreign key (COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table E_INTERVENTION
   add constraint FK_E_INTERV_R_INTERVE_E_ETAPE foreign key (ETAPE_ID)
      references E_ETAPE (ETAPE_ID);

alter table E_INTERVENTION
   add constraint FK_E_INTERV_R_REALISE_E_FONCTI foreign key (FONCTION_ID)
      references E_FONCTION (FONCTION_ID);

alter table E_PROJET
   add constraint FK_E_PROJET_R_CONTACT_E_CONTAC foreign key (CONTACT_ID)
      references E_CONTACT (CONTACT_ID);

alter table E_PROJET
   add constraint FK_E_PROJET_R_INITIAL_E_COLLAB foreign key (COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table E_PROJET
   add constraint FK_E_PROJET_R_NOTIFIE_E_PHASE_ foreign key (CYCLE_VIE_ID)
      references E_PHASE_CYCLE_VIE (CYCLE_VIE_ID);

alter table E_PROJET
   add constraint FK_E_PROJET_R_PRECISE_E_SECTEU foreign key (SECTEUR_ACTIVITE_ID)
      references E_SECTEUR_ACTIVITE (SECTEUR_ACTIVITE_ID);

alter table E_PROJET
   add constraint FK_E_PROJET_R_QUALIFI_E_TYPE_P foreign key (TYPE_PROJET_ID)
      references E_TYPE_PROJET (TYPE_PROJET_ID);

alter table E_PROJET
   add constraint FK_E_PROJET_R_VENDRE_E_CLIENT foreign key (CLIENT_ID)
      references E_CLIENT (CLIENT_ID);

alter table E_SALAIRE
   add constraint FK_E_SALAIR_R_DETIENT_E_COLLAB foreign key (COLLABORATEUR_MATRICULE)
      references E_COLLABORATEUR (COLLABORATEUR_MATRICULE);

alter table R_INFORMER
   add constraint FK_R_INFORM_R_INFORME_E_PROJET foreign key (PROJET_ID)
      references E_PROJET (PROJET_ID);

alter table R_INFORMER
   add constraint FK_R_INFORM_R_INFORME_E_TECHNO foreign key (TECHNOLOGIE_ID)
      references E_TECHNOLOGIE (TECHNOLOGIE_ID);

