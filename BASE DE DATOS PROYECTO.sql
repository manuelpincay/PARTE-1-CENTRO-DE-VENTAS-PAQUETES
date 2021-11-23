/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     23/11/2021 16:20:13                          */
/*==============================================================*/


drop index RELATIONSHIP_24_FK;

drop index RELATIONSHIP_29_FK;

drop index RELATIONSHIP_18_FK;

drop index RELATIONSHIP_17_FK;

drop index ACTO_VANDALICO_PK;

drop table ACTO_VANDALICO;

drop index RELATIONSHIP_2_FK;

drop index ASESOR_DE_VIAJE_PK;

drop table ASESOR_DE_VIAJE;

drop index CENTRO_DE_VENTAS_PT_PK;

drop table CENTRO_DE_VENTAS_PT;

drop index RELATIONSHIP_25_FK;

drop index CIUDAD_PK;

drop table CIUDAD;

drop index RELATIONSHIP_19_FK;

drop index RELATIONSHIP_6_FK;

drop index CLIENTE_VIAJERO_PK;

drop table CLIENTE_VIAJERO;

drop index RELATIONSHIP_23_FK;

drop index RELATIONSHIP_22_FK;

drop index RELATIONSHIP_21_FK;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_1_FK;

drop index CONTRATO_PK;

drop table CONTRATO;

drop index RELATIONSHIP_28_FK;

drop index ESTACIA_PK;

drop table ESTACIA;

drop index RELATIONSHIP_26_FK;

drop index ESTADOS_PK;

drop table ESTADOS;

drop index EVENTO_ENTRETENIMIENTO_PK;

drop table EVENTO_ENTRETENIMIENTO;

drop index FORMA_DE_PAGO_PK;

drop table FORMA_DE_PAGO;

drop index PAIS_PK;

drop table PAIS;

drop index RELATIONSHIP_27_FK;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_9_FK;

drop index PAQUETES_TURISTICOS_PK;

drop table PAQUETES_TURISTICOS;

drop index RESTAURANTE_PK;

drop table RESTAURANTE;

drop index SEGURO_DE_VIDA_PK;

drop table SEGURO_DE_VIDA;

drop index RELATIONSHIP_4_FK;

drop index USUARIO_WEB_PK;

drop table USUARIO_WEB;

/*==============================================================*/
/* Table: ACTO_VANDALICO                                        */
/*==============================================================*/
create table ACTO_VANDALICO (
   ACTO_VANDALICO_ID    INT4                 not null,
   ESTANCIA_ID          VARCHAR(50)          null,
   RESTAURANTE_ID       VARCHAR(50)          null,
   EVENTO_ID            VARCHAR(50)          null,
   CONTRATO_ID          INT4                 null,
   ACTO_VANDALICO_DESCRIPCCION VARCHAR(50)          not null,
   constraint PK_ACTO_VANDALICO primary key (ACTO_VANDALICO_ID)
);

/*==============================================================*/
/* Index: ACTO_VANDALICO_PK                                     */
/*==============================================================*/
create unique index ACTO_VANDALICO_PK on ACTO_VANDALICO (
ACTO_VANDALICO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on ACTO_VANDALICO (
ESTANCIA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on ACTO_VANDALICO (
RESTAURANTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_29_FK on ACTO_VANDALICO (
EVENTO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_24_FK on ACTO_VANDALICO (
CONTRATO_ID
);

/*==============================================================*/
/* Table: ASESOR_DE_VIAJE                                       */
/*==============================================================*/
create table ASESOR_DE_VIAJE (
   ASESOR_ID            INT4                 not null,
   CENTRO_ID            VARCHAR(20)          not null,
   ASESOR_NOMBRE        VARCHAR(50)          not null,
   ASESOR_DNI           VARCHAR(50)          not null,
   ASESOR_FECHA_INGRESO VARCHAR(50)          not null,
   constraint PK_ASESOR_DE_VIAJE primary key (ASESOR_ID)
);

/*==============================================================*/
/* Index: ASESOR_DE_VIAJE_PK                                    */
/*==============================================================*/
create unique index ASESOR_DE_VIAJE_PK on ASESOR_DE_VIAJE (
ASESOR_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on ASESOR_DE_VIAJE (
CENTRO_ID
);

/*==============================================================*/
/* Table: CENTRO_DE_VENTAS_PT                                   */
/*==============================================================*/
create table CENTRO_DE_VENTAS_PT (
   CENTRO_ID            VARCHAR(20)          not null,
   CENTRO_NOMBRE        VARCHAR(50)          not null,
   constraint PK_CENTRO_DE_VENTAS_PT primary key (CENTRO_ID)
);

/*==============================================================*/
/* Index: CENTRO_DE_VENTAS_PT_PK                                */
/*==============================================================*/
create unique index CENTRO_DE_VENTAS_PT_PK on CENTRO_DE_VENTAS_PT (
CENTRO_ID
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   CIUDAD_ID            VARCHAR(5)           not null,
   ESTADO_ID            VARCHAR(5)           null,
   CIUDAD_NOMBRE        VARCHAR(50)          not null,
   constraint PK_CIUDAD primary key (CIUDAD_ID)
);

/*==============================================================*/
/* Index: CIUDAD_PK                                             */
/*==============================================================*/
create unique index CIUDAD_PK on CIUDAD (
CIUDAD_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_25_FK on CIUDAD (
ESTADO_ID
);

/*==============================================================*/
/* Table: CLIENTE_VIAJERO                                       */
/*==============================================================*/
create table CLIENTE_VIAJERO (
   CLIENTE_ID           INT4                 not null,
   ASESOR_ID            INT4                 null,
   USUARIO_WEB_ID       INT4                 null,
   CLIENTE_NOMBRE       VARCHAR(50)          not null,
   CLIENTE_APELLIDO     VARCHAR(50)          not null,
   CLIENTE_DNI          VARCHAR(50)          not null,
   CLIENTE_NACIMIENTO   DATE                 not null,
   constraint PK_CLIENTE_VIAJERO primary key (CLIENTE_ID)
);

/*==============================================================*/
/* Index: CLIENTE_VIAJERO_PK                                    */
/*==============================================================*/
create unique index CLIENTE_VIAJERO_PK on CLIENTE_VIAJERO (
CLIENTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on CLIENTE_VIAJERO (
ASESOR_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_19_FK on CLIENTE_VIAJERO (
USUARIO_WEB_ID
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   CONTRATO_ID          INT4                 not null,
   FORMA_PAGO_ID        VARCHAR(20)          not null,
   PAQUETE_ID           INT4                 not null,
   CLIENTE_ID           INT4                 not null,
   SEGURO_ID            VARCHAR(50)          null,
   ASESOR_ID            INT4                 null,
   USUARIO_WEB_ID       INT4                 null,
   CONTRATO_CONDICIONES VARCHAR(100)         not null,
   CONTRATO_PAGO        MONEY                not null,
   CONTRATO_IDA         DATE                 not null,
   CONTRATO_REGRESO     DATE                 not null,
   constraint PK_CONTRATO primary key (CONTRATO_ID)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
CONTRATO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on CONTRATO (
CLIENTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on CONTRATO (
SEGURO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on CONTRATO (
FORMA_PAGO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on CONTRATO (
PAQUETE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_22_FK on CONTRATO (
ASESOR_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_23_FK on CONTRATO (
USUARIO_WEB_ID
);

/*==============================================================*/
/* Table: ESTACIA                                               */
/*==============================================================*/
create table ESTACIA (
   ESTANCIA_ID          VARCHAR(50)          not null,
   CIUDAD_ID            VARCHAR(5)           not null,
   ESTANCA_DIRECCION    VARCHAR(50)          not null,
   ESTANCIA_TELEFONO    VARCHAR(50)          not null,
   ESTACIA_TRASLADO     VARCHAR(50)          not null,
   constraint PK_ESTACIA primary key (ESTANCIA_ID)
);

/*==============================================================*/
/* Index: ESTACIA_PK                                            */
/*==============================================================*/
create unique index ESTACIA_PK on ESTACIA (
ESTANCIA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_28_FK on ESTACIA (
CIUDAD_ID
);

/*==============================================================*/
/* Table: ESTADOS                                               */
/*==============================================================*/
create table ESTADOS (
   ESTADO_ID            VARCHAR(5)           not null,
   PAIS_ID              VARCHAR(5)           not null,
   ESTADO_NOMBRE        VARCHAR(50)          not null,
   constraint PK_ESTADOS primary key (ESTADO_ID)
);

/*==============================================================*/
/* Index: ESTADOS_PK                                            */
/*==============================================================*/
create unique index ESTADOS_PK on ESTADOS (
ESTADO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_26_FK on ESTADOS (
PAIS_ID
);

/*==============================================================*/
/* Table: EVENTO_ENTRETENIMIENTO                                */
/*==============================================================*/
create table EVENTO_ENTRETENIMIENTO (
   EVENTO_ID            VARCHAR(50)          not null,
   EVENTO_LUGAR         VARCHAR(50)          not null,
   EVENTO_HORA          TIME                 not null,
   constraint PK_EVENTO_ENTRETENIMIENTO primary key (EVENTO_ID)
);

/*==============================================================*/
/* Index: EVENTO_ENTRETENIMIENTO_PK                             */
/*==============================================================*/
create unique index EVENTO_ENTRETENIMIENTO_PK on EVENTO_ENTRETENIMIENTO (
EVENTO_ID
);

/*==============================================================*/
/* Table: FORMA_DE_PAGO                                         */
/*==============================================================*/
create table FORMA_DE_PAGO (
   FORMA_PAGO_ID        VARCHAR(20)          not null,
   FORMA_PAGO_TIPO      VARCHAR(50)          not null,
   constraint PK_FORMA_DE_PAGO primary key (FORMA_PAGO_ID)
);

/*==============================================================*/
/* Index: FORMA_DE_PAGO_PK                                      */
/*==============================================================*/
create unique index FORMA_DE_PAGO_PK on FORMA_DE_PAGO (
FORMA_PAGO_ID
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   PAIS_ID              VARCHAR(5)           not null,
   PAIS_MOMBRE          VARCHAR(50)          not null,
   constraint PK_PAIS primary key (PAIS_ID)
);

/*==============================================================*/
/* Index: PAIS_PK                                               */
/*==============================================================*/
create unique index PAIS_PK on PAIS (
PAIS_ID
);

/*==============================================================*/
/* Table: PAQUETES_TURISTICOS                                   */
/*==============================================================*/
create table PAQUETES_TURISTICOS (
   PAQUETE_ID           INT4                 not null,
   RESTAURANTE_ID       VARCHAR(50)          null,
   EVENTO_ID            VARCHAR(50)          null,
   ESTANCIA_ID          VARCHAR(50)          null,
   CIUDAD_ID            VARCHAR(5)           null,
   PAQUETE_NOMBRE       VARCHAR(50)          not null,
   PAQUETE_PRECIO       MONEY                not null,
   constraint PK_PAQUETES_TURISTICOS primary key (PAQUETE_ID)
);

/*==============================================================*/
/* Index: PAQUETES_TURISTICOS_PK                                */
/*==============================================================*/
create unique index PAQUETES_TURISTICOS_PK on PAQUETES_TURISTICOS (
PAQUETE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on PAQUETES_TURISTICOS (
ESTANCIA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on PAQUETES_TURISTICOS (
RESTAURANTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on PAQUETES_TURISTICOS (
EVENTO_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_27_FK on PAQUETES_TURISTICOS (
CIUDAD_ID
);

/*==============================================================*/
/* Table: RESTAURANTE                                           */
/*==============================================================*/
create table RESTAURANTE (
   RESTAURANTE_ID       VARCHAR(50)          not null,
   RESTAURANTE_DIRECCION VARCHAR(50)          not null,
   RESTAURAMTE_HORA     TIME                 not null,
   constraint PK_RESTAURANTE primary key (RESTAURANTE_ID)
);

/*==============================================================*/
/* Index: RESTAURANTE_PK                                        */
/*==============================================================*/
create unique index RESTAURANTE_PK on RESTAURANTE (
RESTAURANTE_ID
);

/*==============================================================*/
/* Table: SEGURO_DE_VIDA                                        */
/*==============================================================*/
create table SEGURO_DE_VIDA (
   SEGURO_ID            VARCHAR(50)          not null,
   SEGURO_COBERTURAS    VARCHAR(100)         not null,
   SEGURO_PRECIO        MONEY                not null,
   constraint PK_SEGURO_DE_VIDA primary key (SEGURO_ID)
);

/*==============================================================*/
/* Index: SEGURO_DE_VIDA_PK                                     */
/*==============================================================*/
create unique index SEGURO_DE_VIDA_PK on SEGURO_DE_VIDA (
SEGURO_ID
);

/*==============================================================*/
/* Table: USUARIO_WEB                                           */
/*==============================================================*/
create table USUARIO_WEB (
   USUARIO_WEB_ID       INT4                 not null,
   CENTRO_ID            VARCHAR(20)          not null,
   USUARIO_WEB_NOMBRE   VARCHAR(50)          not null,
   USUARIO_WEB_PAIS     VARCHAR(50)          not null,
   USUARIO_WEB_ESTADO   VARCHAR(50)          not null,
   constraint PK_USUARIO_WEB primary key (USUARIO_WEB_ID)
);

/*==============================================================*/
/* Index: USUARIO_WEB_PK                                        */
/*==============================================================*/
create unique index USUARIO_WEB_PK on USUARIO_WEB (
USUARIO_WEB_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on USUARIO_WEB (
CENTRO_ID
);

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_ESTACIA foreign key (ESTANCIA_ID)
      references ESTACIA (ESTANCIA_ID)
      on delete restrict on update restrict;

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_RESTAURA foreign key (RESTAURANTE_ID)
      references RESTAURANTE (RESTAURANTE_ID)
      on delete restrict on update restrict;

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_CONTRATO foreign key (CONTRATO_ID)
      references CONTRATO (CONTRATO_ID)
      on delete restrict on update restrict;

alter table ACTO_VANDALICO
   add constraint FK_ACTO_VAN_RELATIONS_EVENTO_E foreign key (EVENTO_ID)
      references EVENTO_ENTRETENIMIENTO (EVENTO_ID)
      on delete restrict on update restrict;

alter table ASESOR_DE_VIAJE
   add constraint FK_ASESOR_D_RELATIONS_CENTRO_D foreign key (CENTRO_ID)
      references CENTRO_DE_VENTAS_PT (CENTRO_ID)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_RELATIONS_ESTADOS foreign key (ESTADO_ID)
      references ESTADOS (ESTADO_ID)
      on delete restrict on update restrict;

alter table CLIENTE_VIAJERO
   add constraint FK_CLIENTE__RELATIONS_USUARIO_ foreign key (USUARIO_WEB_ID)
      references USUARIO_WEB (USUARIO_WEB_ID)
      on delete restrict on update restrict;

alter table CLIENTE_VIAJERO
   add constraint FK_CLIENTE__RELATIONS_ASESOR_D foreign key (ASESOR_ID)
      references ASESOR_DE_VIAJE (ASESOR_ID)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_CLIENTE_ foreign key (CLIENTE_ID)
      references CLIENTE_VIAJERO (CLIENTE_ID)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_FORMA_DE foreign key (FORMA_PAGO_ID)
      references FORMA_DE_PAGO (FORMA_PAGO_ID)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_PAQUETES foreign key (PAQUETE_ID)
      references PAQUETES_TURISTICOS (PAQUETE_ID)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_ASESOR_D foreign key (ASESOR_ID)
      references ASESOR_DE_VIAJE (ASESOR_ID)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_USUARIO_ foreign key (USUARIO_WEB_ID)
      references USUARIO_WEB (USUARIO_WEB_ID)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_SEGURO_D foreign key (SEGURO_ID)
      references SEGURO_DE_VIDA (SEGURO_ID)
      on delete restrict on update restrict;

alter table ESTACIA
   add constraint FK_ESTACIA_RELATIONS_CIUDAD foreign key (CIUDAD_ID)
      references CIUDAD (CIUDAD_ID)
      on delete restrict on update restrict;

alter table ESTADOS
   add constraint FK_ESTADOS_RELATIONS_PAIS foreign key (PAIS_ID)
      references PAIS (PAIS_ID)
      on delete restrict on update restrict;

alter table PAQUETES_TURISTICOS
   add constraint FK_PAQUETES_RELATIONS_RESTAURA foreign key (RESTAURANTE_ID)
      references RESTAURANTE (RESTAURANTE_ID)
      on delete restrict on update restrict;

alter table PAQUETES_TURISTICOS
   add constraint FK_PAQUETES_RELATIONS_EVENTO_E foreign key (EVENTO_ID)
      references EVENTO_ENTRETENIMIENTO (EVENTO_ID)
      on delete restrict on update restrict;

alter table PAQUETES_TURISTICOS
   add constraint FK_PAQUETES_RELATIONS_CIUDAD foreign key (CIUDAD_ID)
      references CIUDAD (CIUDAD_ID)
      on delete restrict on update restrict;

alter table PAQUETES_TURISTICOS
   add constraint FK_PAQUETES_RELATIONS_ESTACIA foreign key (ESTANCIA_ID)
      references ESTACIA (ESTANCIA_ID)
      on delete restrict on update restrict;

alter table USUARIO_WEB
   add constraint FK_USUARIO__RELATIONS_CENTRO_D foreign key (CENTRO_ID)
      references CENTRO_DE_VENTAS_PT (CENTRO_ID)
      on delete restrict on update restrict;

