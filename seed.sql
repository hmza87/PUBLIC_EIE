USE [seed]
GO
SET IDENTITY_INSERT [dbo].[classification] ON 

INSERT [dbo].[classification] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'dangereux')
INSERT [dbo].[classification] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'non dangereux')
SET IDENTITY_INSERT [dbo].[classification] OFF
GO
SET IDENTITY_INSERT [dbo].[code] ON 

INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (15, NULL, N'Déchets provenant de l''exploration et de l''exploitation des mines, et des carrières, et de la préparation et du traitement ultérieure de minerais', N'01', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (16, NULL, N'Déchets provenant de l''extraction des minéraux', N'01 01', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (17, NULL, N'déchets provenant de l''extraction des minéraux métallifères', N'01 01 01', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (18, NULL, N'déchets provenant de l''extraction des minéraux non métallifères', N'01 01 02 ', NULL, 2)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (19, NULL, N'sjj', N'shsh', NULL, NULL)
INSERT [dbo].[code] ([id_code], [delete_date_time], [nom_ar], [nom_fr], [operation], [id_classification]) VALUES (20, NULL, N'sjj', N'shsh', NULL, NULL)
SET IDENTITY_INSERT [dbo].[code] OFF
GO
SET IDENTITY_INSERT [dbo].[profil] ON 

INSERT [dbo].[profil] ([profil_id], [create_date_time], [delete_date_time], [nom], [update_date_time]) VALUES (1, NULL, NULL, N'ADMIN', NULL)
SET IDENTITY_INSERT [dbo].[profil] OFF
GO
SET IDENTITY_INSERT [dbo].[secteur] ON 

INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'AGRICULTURE, SYLVICULTURE ET PÒCHE', N'AGRICULTURE, SYLVICULTURE ET PÒCHE')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'INDUSTRIES EXTRACTIVES', N'INDUSTRIES EXTRACTIVES')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'INDUSTRIE MANUFACTURIÔRE', N'INDUSTRIE MANUFACTURIÔRE')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'CONSTRUCTION', N'CONSTRUCTION')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'TRANSPORTS ET ENTREPOSAGE', N'TRANSPORTS ET ENTREPOSAGE')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1002, CAST(N'2021-01-25T14:16:29.3680000' AS DateTime2), N'ff', N'fffff')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1003, CAST(N'2021-01-25T14:16:45.4070000' AS DateTime2), N'ff', N'eeeeee')
INSERT [dbo].[secteur] ([id_secteur], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1004, CAST(N'2021-01-27T13:06:58.6740000' AS DateTime2), N'sss', N'sssssddf')
SET IDENTITY_INSERT [dbo].[secteur] OFF
GO
SET IDENTITY_INSERT [dbo].[societe] ON 

INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1010, NULL, N'fes', N'fes', N'95579', NULL, NULL, N'eie@gmail.com', N'0', N'0989898989', NULL, N'hassaneddaoudi', N'$2a$10$dwS8LxFvLsWl9WvoF0twS.HgHdMmVQ66DyqYn8spOqe0J0eiq2Gxa', N'شركة النقل', N'societe X', N'0656197687', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1011, NULL, N'adrese', N'adresse', N'57239', NULL, NULL, N'mhamdijaouad@gmail.com', N'0', N'0255252458', NULL, N'mhamdi jouaud', N'$2a$10$Bqmn7zJ3I43aYHsZla.vtOwFRi1EerDIuDAC9LmsOQbdtsXnGAA2u', N'شركة النقل', N'societe X', N'0658585825', NULL, NULL, NULL, 2)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1019, NULL, N'test', N'test', N'94796', NULL, NULL, N'amal.kabkab@gmail.com', N'0', N'0535353535', NULL, N'aml', N'$2a$10$AEw/4D9B60a9PWDr9gYriu.IVYv1XUH9ZoC17iNy3L/nJ/GdHrK2.', N'test', N'test', N'0675757575', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1060, NULL, N'dd', N'd', N'34624', NULL, NULL, N'mhamdi@environnement.gov.ma', N'0', N'0989898989', NULL, N'amal.kabkab@gmail.com', N'$2a$10$9gCKd/weDikIwo0N4o7z8OxMoFCQH2258fBDJBM0fRhFGWrrx9BLm', N'', N'societe X', N'0656197687', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1089, NULL, N'', N'', N'98589', NULL, NULL, N'elalaoui@environnement.gov.ma', N'0', N'0989898989', NULL, N'amal.kabkab@gmail.com', N'$2a$10$ONxKGFqKq.B/0kllFEihtujnXtv22agFtkXLpvc0WnAYXJzEY091e', N'', N'', N'0656197687', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1097, NULL, N'fes', N'fes', N'27731', NULL, NULL, N'hassaneddaoudi1991@gmail.com', N'1', N'0522457899', NULL, N'test', N'$2a$10$WCACLJkieytFqbcriYaeCO4uJmlfW6cYbpH/gTBIvaiPrCDcCPEVG', N'شركة النقل', N'societe X', N'0575757575', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1098, NULL, N'qfzeferf', N'rgregre', N'57647', NULL, NULL, N'mhamdijaouad@gmail.com', N'0', N'0542424510', NULL, N'mhamdi', N'$2a$10$lW6FlUSwPli2h5NkPvetG.R4x4MnY8zUBHiaTnMRx4QSPdMQGo/8S', N'رخص', N'autorisation ', N'0655555555', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1099, NULL, N'rabat', N'rabat', N'15677', NULL, NULL, N'sgmsi1@environnement.gov.ma', N'0', N'0542424510', NULL, N'mhamdi jaouad', N'$2a$10$XQyPI3W9O88ZEGSMKRz9Be1NRHBbZ8vzbZ6c3YDo8lRpR9xqyEyre', N'رخص2', N'autorisation 2', N'0655555555', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1100, NULL, N'', N'', N'', NULL, NULL, N'', N'0', N'', NULL, N'elfatihi', N'$2a$10$qDeP/GoWxNn2/O2tbur9jO9GeADG2Cg0sj2UdqDX6rbISv0ii3MH.', N'', N'', N'', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1101, NULL, N'', N'', N'', NULL, NULL, N'', N'0', N'', NULL, N'elfatihi', N'$2a$10$00A8OSRSJ3lqgDBsYWdpJ.ut560IQUv2WSnjxhLh8NHLHeNeozkrW', N'', N'', N'', NULL, NULL, NULL, 1)
INSERT [dbo].[societe] ([societes_id], [num_rc], [adresse_ar], [adresse_fr], [captcha], [delete_date_time], [deleted], [email], [etat], [fax], [name_ar], [name_fr], [password], [raison_ar], [raison_fr], [tel], [url_certificat], [url_registre], [profil_id], [idsecteur]) VALUES (1102, NULL, N'', N'', N'33612', NULL, NULL, N'elfatihi@environnement.gov.ma', N'0', N'0666666666', NULL, N'elfatihi', N'$2a$10$WWjlGDYleHHUnhqrCvUD5OyJ3DLG1/zPkmlE8dZ3HX98stAbVY0lG', N'', N'', N'0666666666', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[societe] OFF
GO
SET IDENTITY_INSERT [dbo].[compte] ON 

INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1014, NULL, NULL, NULL, NULL, N'eie@gmail.com', NULL, N'$2a$10$3sd6GPFFDpTDP7P/bcU.9O6Kac1BR8mkwEPHJ972eq3x68feih2P2', NULL, NULL, 1010)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1015, NULL, NULL, NULL, NULL, N'mhamdijaouad1@gmail.com', NULL, N'$2a$10$cvyR/ZPSXnjvVoYUAG0OG.3tp7FIkiTqFQ/tRfJTs438XMXq0dz..', NULL, NULL, 1011)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1023, NULL, NULL, NULL, NULL, N'amal.kabkab@gmail.com', NULL, N'$2a$10$b0yKM9MYdraXHRmI2sYyFOeUQPzRE457SW145kAEG3iGMicaHixwK', NULL, NULL, 1019)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1065, NULL, NULL, NULL, NULL, N'mhamdi@environnement.gov.ma', NULL, N'$2a$10$ttgK0gl8snxCUefu8P9speFxhcJnjqWGXonsgjWbhGYPRNDqsKDku', NULL, NULL, 1060)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1094, NULL, NULL, NULL, NULL, N'elalaoui@environnement.gov.ma', NULL, N'$2a$10$nyIlMr2Tn2Qk/g/O/xJkmuLkvdDHCVrOdC/eqnwi9S30mYXDZYEau', NULL, NULL, 1089)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1102, NULL, NULL, NULL, NULL, N'hassaneddaoudi1991@gmail.com', NULL, N'$2a$10$BMHKxjJob05gBNLVKxX2gueNtnD.fWLN36ZUz1Cqr.9NuA3G6Bp/q', NULL, NULL, 1097)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1103, NULL, NULL, NULL, NULL, N'mhamdijaouad@gmail.com', NULL, N'$2a$10$Yh3YG87PAOYi.ZorJUEiZeA.qDqGDJ7Rh1ZkTkLf.n8xEyVGyw5Zm', NULL, NULL, 1098)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1104, NULL, NULL, NULL, NULL, N'sgmsi1@environnement.gov.ma', NULL, N'$2a$10$D2v3Y5qfok/GSHOqzwqIFOPp8uwPOeDQalOTBCu2uCsTJPnbHaQCi', NULL, NULL, 1099)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1105, NULL, NULL, NULL, NULL, N'', NULL, N'$2a$10$FoTHNt9V2aD.ColEAovXEuJqAtdRo8NoUHhrhymi1xh7NL4R99ghS', NULL, NULL, 1100)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1106, NULL, NULL, NULL, NULL, N'', NULL, N'$2a$10$M9U3U3c2gGM0xb3C4tCg2O.xGMi4uKswxiYRESdulrMWZhOiyZsrm', NULL, NULL, 1101)
INSERT [dbo].[compte] ([compte_id], [commission], [delete_date_time], [deleted], [depot], [email], [nom], [password], [tel], [profil_id], [societes_id]) VALUES (1107, NULL, NULL, NULL, NULL, N'elfatihi@environnement.gov.ma', NULL, N'$2a$10$BmWTodhhpc1NqSGYotGt/uSc4ObwjOZQ6LJwIo58AGNNZtsbhfmaa', NULL, NULL, 1102)
SET IDENTITY_INSERT [dbo].[compte] OFF
GO
SET IDENTITY_INSERT [dbo].[categorie] ON 

INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'categorie1', N'cat1')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'categorie2', N'CAT2')
INSERT [dbo].[categorie] ([id_categorie], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, CAST(N'2021-01-25T16:49:50.0030000' AS DateTime2), N'Catégorie', N'Catégorie312')
SET IDENTITY_INSERT [dbo].[categorie] OFF
GO
SET IDENTITY_INSERT [dbo].[statut_projet] ON 

INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'en attente', N'en attente')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'réunion planifier', N'réunion planifier')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Non Acceptable', N'Non Acceptable')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Quorum no atteint', N'Quorum no atteint')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Attente Signature', N'Attente Signature')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Signé', N'Signé')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'attente documents définitive', N'attente documents définitive')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'arrete d''examen', N'arrete d''examen')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, N'Documment definitive attaché', N'Documment definitive attaché')
INSERT [dbo].[statut_projet] ([id_statut_projet], [delete_date_time], [nom_ar], [nom_fr]) VALUES (10, NULL, N'Document à amélioré', N'Document à amélioré')
SET IDENTITY_INSERT [dbo].[statut_projet] OFF
GO
SET IDENTITY_INSERT [dbo].[demande_infromation] ON 

INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut], [commentaire_avis], [id_statut_installation], [type_env]) VALUES (1, N'Commentaire', N'Représentant', CAST(N'2021-01-22T09:49:29.2850000' AS DateTime2), CAST(N'2021-01-22T09:54:34.7480000' AS DateTime2), NULL, N'10', N'eie@gmail.com', N'0522457899', N'Information ', N'Intitulé de projet', N'12', N'N-0', NULL, N'social', NULL, N'05757575757', N'non', N'pdf1.pdf', N'pdf1.pdf', NULL, N'/assets/myFile/file515.pdf', N'/assets/myFile/file733.pdf', N'/assets/myFile/file791.pdf', N'/assets/myFile/file856.pdf', N'/assets/myFile/file626.pdf', N'/assets/myFile/file561.pdf', N'/assets/myFile/file1284.pdf', 1, 1014, 5, NULL, NULL, NULL)
INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut], [commentaire_avis], [id_statut_installation], [type_env]) VALUES (2, N'commentaiare', N'Représentant', CAST(N'2021-01-22T10:59:12.2790000' AS DateTime2), CAST(N'2021-01-22T11:01:54.1140000' AS DateTime2), NULL, N'12', N'eie@gmail.com', N'0525252525', N'infpo', N'Intitulé de projet', N'14', N'N-1', NULL, N'social', NULL, N'065656556565', N'non', N'pdf1.pdf', N'pdf1.pdf', NULL, N'/assets/myFile/file1035.pdf', N'/assets/myFile/file997.pdf', N'/assets/myFile/file1422.pdf', N'/assets/myFile/file745.pdf', N'/assets/myFile/file512.pdf', N'/assets/myFile/file546.pdf', N'/assets/myFile/file913.pdf', 1, 1015, 5, NULL, NULL, NULL)
INSERT [dbo].[demande_infromation] ([id_demande_information], [commentaire], [contact], [date_depot], [date_validation], [delete_date_time], [effectif], [email], [fax], [information_projet], [intitule_projet], [nbr_emploi], [num_demande], [petitionaire], [raison_social], [represantant], [tel], [tronsfrontalier], [url_enqu_ete_publique1], [url_enqu_ete_publique2], [url_avis], [url_cachier], [url_cachier_defenitive], [url_enquette], [url_enquette_defenitive], [url_etude], [url_presence], [url_pv], [id_categorie], [id_compte], [id_statut], [commentaire_avis], [id_statut_installation], [type_env]) VALUES (3, N'', N'2', CAST(N'2021-01-25T16:01:34.4390000' AS DateTime2), CAST(N'2021-01-25T16:01:56.0090000' AS DateTime2), NULL, N'2', N'2', N'2', N'222', N'222', N'2', N'N-2', NULL, N'2', NULL, N'2', N'oui', N'pdf1.pdf', N'', NULL, NULL, N'/assets/myFile/file951.pdf', NULL, N'/assets/myFile/file1105.pdf', NULL, N'/assets/myFile/file951.pdf', N'/assets/myFile/file1020.pdf', 2, 1014, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[demande_infromation] OFF
GO
SET IDENTITY_INSERT [dbo].[unite] ON 

INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'kg', N'kg')
INSERT [dbo].[unite] ([unite_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'm', N'm')
SET IDENTITY_INSERT [dbo].[unite] OFF
GO
SET IDENTITY_INSERT [dbo].[caracteristiquephysique] ON 

INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Poudreux/pulvérulent', N'Poudreux/pulvérulent')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Solide', N'Solide')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'Pâteux/sirupeux', N'Pâteux/sirupeux')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'Boueux', N'Boueux')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'Liquide', N'Liquide')
INSERT [dbo].[caracteristiquephysique] ([id_classification], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'Gazeux', N'Gazeux')
SET IDENTITY_INSERT [dbo].[caracteristiquephysique] OFF
GO
SET IDENTITY_INSERT [dbo].[eliminateur] ON 

INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [pattente], [tel]) VALUES (1, NULL, N'hassan3', NULL, N'hassan3', NULL, N'0535353535', N'332', N'HASSAN@gmail.com', N'élimination2', N'élimination 2', NULL, N'0675757575')
INSERT [dbo].[eliminateur] ([id_eliminateur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [pattente], [tel]) VALUES (2, NULL, N'adresse', NULL, N'hassan2', NULL, N'0998989898', N'1525', N'hassan2@gmail.com', N'ttt', N'hassan', NULL, N'06556566')
SET IDENTITY_INSERT [dbo].[eliminateur] OFF
GO
SET IDENTITY_INSERT [dbo].[importateurnotifiant] ON 

INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (2, NULL, N'fes', NULL, N'hassan', NULL, N'0535353535', N'332', N'hassan3@gmail.com', N'twins ar', N'twins', N'2', N'0676767676')
INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (3, NULL, N'fes', NULL, N'hassan2', NULL, N'0535353535', N'332', N'hassan2@gmail.com', N'twins2 ar', N'twins2', N'3', N'05757575757')
INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (4, NULL, N'adresse', NULL, N'contact', NULL, N'0656565656', N'5888', N'HASSAN@gmail.com', N'الإسم ', N'Nom ', N'5', N'0656565656')
INSERT [dbo].[importateurnotifiant] ([id_importateur_notifiant], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [mail], [nom_ar], [nom_fr], [notification_id], [tel]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SS', N'7', NULL)
SET IDENTITY_INSERT [dbo].[importateurnotifiant] OFF
GO
SET IDENTITY_INSERT [dbo].[producteur] ON 

INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel]) VALUES (1, NULL, N'fezs', NULL, N'hassan', NULL, N'0535353535', N'332', NULL, NULL, N'hassan2@gmail.com', N'élimination1 ', N'élimination 1', N'0676767676')
INSERT [dbo].[producteur] ([id_producteur], [adresse_ar], [adresse_fr], [contact_ar], [contact_fr], [delete_date_time], [fax], [idf], [lieu_ar], [lieu_fr], [mail], [nom_ar], [nom_fr], [tel]) VALUES (2, NULL, N'adresse', NULL, N'hassan', NULL, N'0656565656', N'12458', NULL, NULL, N'eie@gmail.com', N'identifiant', N'hassan', N'065858588')
SET IDENTITY_INSERT [dbo].[producteur] OFF
GO
SET IDENTITY_INSERT [dbo].[moyen_transport] ON 

INSERT [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'Route', N'Route')
INSERT [dbo].[moyen_transport] ([id_moyen_transport], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'Train/Rail', N'Train/Rail')
SET IDENTITY_INSERT [dbo].[moyen_transport] OFF
GO
SET IDENTITY_INSERT [dbo].[transporteur] ON 

INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, N'AQUAFLORE PROTECT', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, N'LOGIPRO', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, N'SITA MAROC RECYCLING ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, N'DACHSER', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, N'SELSAFAA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, N'ECONORME', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, N'ECORECYCLAGE', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, N'POLLUCLEAN', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, N'NITAN-', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, N'VACUM-', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, N'POMPAGE ET RAFFINAGE DU MAROC', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, N'LUBO ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, N'TRANSIT JALAL- ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, N'MEGATRATEMENT', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[transporteur] ([id_transporteur], [adresse_ar], [adresse_fr], [delete_date_time], [fax], [mail], [nom_ar], [nom_fr], [tel], [id_moyen_transport], [idf], [etat], [pattente], [date_pris_charge]) VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, N'Mama Marine', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[transporteur] OFF
GO
SET IDENTITY_INSERT [dbo].[type_conditionement] ON 

INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, NULL, N'Fût métallique')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, NULL, N'Tonneau en bois')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, NULL, N'Bidon (jerricane)')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, NULL, N'Caisse')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, NULL, N'Sac')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, NULL, N'Emballage composite')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, NULL, N'Récipient à pression')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, NULL, N'Récipient pour vrac')
INSERT [dbo].[type_conditionement] ([type_conditionement_id], [delete_date_time], [nom_ar], [nom_fr]) VALUES (9, NULL, NULL, N'Autre (préciser)')
SET IDENTITY_INSERT [dbo].[type_conditionement] OFF
GO
SET IDENTITY_INSERT [dbo].[zonnefranche] ON 

INSERT [dbo].[zonnefranche] ([id_zonnefranche], [delete_date_time], [nom_ar], [nom_fr], [code]) VALUES (2, NULL, N'TANGER', N'TANGER', N'ZT')
INSERT [dbo].[zonnefranche] ([id_zonnefranche], [delete_date_time], [nom_ar], [nom_fr], [code]) VALUES (3, NULL, N'KHENITRA', N'KHENITRA', N'ZK')
SET IDENTITY_INSERT [dbo].[zonnefranche] OFF
GO
SET IDENTITY_INSERT [dbo].[pays] ON 

INSERT [dbo].[pays] ([pays_id], [code_iso], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, N'Ta', NULL, N'test', N'test')
SET IDENTITY_INSERT [dbo].[pays] OFF
GO
SET IDENTITY_INSERT [dbo].[notification] ON 

INSERT [dbo].[notification] ([id_notification], [commentaire], [dated], [date_depot], [datef], [date_validation], [date_reel], [dateaut1], [dateaut2], [delete_date_time], [dernier], [destination_final], [expedition], [lieu], [manutention], [nbr_colis], [nbr_total], [no], [num_notification], [operation], [premier], [producteur_text], [quantite], [quantite_reel], [serie], [statut], [uniques], [idcaracteristque_physique], [classification_id], [code_id], [compte_id], [ideliminateur], [idimportateur_notifiant], [idproducteur], [transporteur_id], [idtypeconditionnement], [unite_id], [idzonne_franche], [id_pays], [zf_et]) VALUES (2, NULL, NULL, CAST(N'2021-01-22T09:18:10.3433333' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'2021-ZT-1', N'valorisation', NULL, N'Producteur', N'300', NULL, NULL, N'en attente', NULL, NULL, 2, 16, 1014, NULL, 2, NULL, NULL, NULL, 1, 2, NULL, NULL)
INSERT [dbo].[notification] ([id_notification], [commentaire], [dated], [date_depot], [datef], [date_validation], [date_reel], [dateaut1], [dateaut2], [delete_date_time], [dernier], [destination_final], [expedition], [lieu], [manutention], [nbr_colis], [nbr_total], [no], [num_notification], [operation], [premier], [producteur_text], [quantite], [quantite_reel], [serie], [statut], [uniques], [idcaracteristque_physique], [classification_id], [code_id], [compte_id], [ideliminateur], [idimportateur_notifiant], [idproducteur], [transporteur_id], [idtypeconditionnement], [unite_id], [idzonne_franche], [id_pays], [zf_et]) VALUES (3, NULL, NULL, CAST(N'2021-01-22T09:19:14.3566667' AS DateTime2), NULL, CAST(N'2021-01-22T09:34:05.1000000' AS DateTime2), CAST(N'2021-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-31T00:00:00.0000000' AS DateTime2), NULL, N'2021-01-31', N'fes', N'222', N'fesff', N'non', N'222', NULL, 2, N'2021-ZK-2', N'valorisation', N'2021-01-01', N'Producteur', N'555', N'25', NULL, N'valide', N'Expéditions multiples', 4, 2, 16, 1014, 1, 3, 1, NULL, 5, 1, 3, NULL, NULL)
INSERT [dbo].[notification] ([id_notification], [commentaire], [dated], [date_depot], [datef], [date_validation], [date_reel], [dateaut1], [dateaut2], [delete_date_time], [dernier], [destination_final], [expedition], [lieu], [manutention], [nbr_colis], [nbr_total], [no], [num_notification], [operation], [premier], [producteur_text], [quantite], [quantite_reel], [serie], [statut], [uniques], [idcaracteristque_physique], [classification_id], [code_id], [compte_id], [ideliminateur], [idimportateur_notifiant], [idproducteur], [transporteur_id], [idtypeconditionnement], [unite_id], [idzonne_franche], [id_pays], [zf_et]) VALUES (5, NULL, NULL, CAST(N'2021-01-22T10:35:43.4733333' AS DateTime2), NULL, CAST(N'2021-01-22T10:49:35.8620000' AS DateTime2), CAST(N'2021-01-14T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-02T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-29T00:00:00.0000000' AS DateTime2), NULL, N'2021-01-31', N'FES', N'1255', N'LIEU', N'non', N'12', NULL, 4, N'2021-ZT-4', N'valorisation', N'2021-01-15', N'Producteur', N'1255', N'455555', NULL, N'valide', N'Expédition unique ', 1, 2, 17, 1015, 2, 4, 2, NULL, 1, 1, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[notification] OFF
GO
SET IDENTITY_INSERT [dbo].[doc_import] ON 

INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (1, NULL, N'Contrat', N'Contrat', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (2, NULL, N'doc notification', N'doc notification', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (3, NULL, N'doc mouvement', N'doc mouvement', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (4, NULL, N'doc installation', N'doc installation', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (5, NULL, N'Garantie Financière', N'Garantie Financière', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (6, NULL, N'Analyses/Fiche d’identification DD', N'Analyses/Fiche d’identification DD', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (7, NULL, N' Autorisation d’exploitation l’installation', N' Autorisation d’exploitation l’installation', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (8, NULL, N'Assurance Responsabilité Civile', N'Assurance Responsabilité Civile', 1, N'1')
INSERT [dbo].[doc_import] ([id_doc_import], [delete_date_time], [nom_ar], [nom_fr], [id_classification], [typeaut]) VALUES (9, NULL, N'Déclaration l’honneur l’exactitude', N'Déclaration l’honneur l’exactitude', 1, N'1')
SET IDENTITY_INSERT [dbo].[doc_import] OFF
GO
SET IDENTITY_INSERT [dbo].[autorisationparam] ON 

INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'استيراد المخلفات (منطقة حرة)', N'Importation dechets (zone franche)')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'جمع / نقل النفايات الخطرة', N'Collecte/transport des déchets dangereux')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'استيراد مخلفات غير خطرة من دولة أجنبية', N'Importation des déchets non dangereux d’un pays étranger')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'مرفق معالجة النفايات', N'Installation de traitement des déchets')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (5, NULL, N'استيراد المخلفات غير الخطرة من المنطقة الحرة', N'Importation des déchets non dangereux d’une zone franche')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (6, NULL, N'تصدير المخلفات الخطرة', N'Exportation des déchets dangereux ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (7, NULL, N'عبور النفايات', N'Transit des Déchets ')
INSERT [dbo].[autorisationparam] ([id_autorisation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (8, NULL, N'طلب ترخيص استيراد نفايات غير حديدية ', N'Demande de  licence d’importation des déchets non ferreux')
SET IDENTITY_INSERT [dbo].[autorisationparam] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluationparam] ON 

INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (1, NULL, N'التقييم البيئي الاستراتيجي', N'Évaluation environnementale stratégique (EES)')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (2, NULL, N'التدقيق البيئي', N'Audit environnementale')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (3, NULL, N'إشعار الأثر', N'Notice d’impact')
INSERT [dbo].[evaluationparam] ([id_evaluation], [delete_date_time], [nom_ar], [nom_fr]) VALUES (4, NULL, N'دراسة الأثر البيئي ', N'Etude d’impact environnementale')
SET IDENTITY_INSERT [dbo].[evaluationparam] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (42, NULL, N'Quel est le coût de la procédure ?', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (43, NULL, N'Quelles sont les étapes d’obtention d’une Décision d’Acceptabilité Environnementale ?', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (44, NULL, N'Quelles sont les pièces nécessaires à la constitution du dossier d’EIE ?', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (45, NULL, N'Quel est le contenu du rapport d’Etude d’Impact sur l’Environnement (EIE) et du Programme de Surveillance et de Suivi Environnemental (PSSE) ?', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (46, NULL, N'Quels sont les projets assujettis à l’EIE ?', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (47, NULL, N'Quel est le référentiel juridique ? (Documents téléchargeables)', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (48, NULL, N'Qu’est-ce que l’Etude d’Impact sur l’Environnement ?', N'', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (49, CAST(N'2021-02-19T15:54:03.7600000' AS DateTime2), N'question test 3', NULL, N'1', 1, NULL, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (50, CAST(N'2021-02-19T15:53:59.4880000' AS DateTime2), N'quest test 2', NULL, N'2', NULL, NULL, 3)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (51, NULL, N'', N'ما هي مراحل مسطرة دراسة التأثير على البيئة؟', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (52, CAST(N'2021-02-19T17:29:04.5310000' AS DateTime2), N'', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'1', NULL, NULL, NULL)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (53, NULL, N'', N'ما هي المستندات المطلوبة في مسطرة دراسة التأثير على البيئة؟', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (54, NULL, N'', N' ما هو مضمون دراسة التأثير على البيئة و برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي؟', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (55, NULL, N'', N'ما هي المشاريع الخاضعة لدراسة التأثير على البيئة؟', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (56, NULL, N'', N'ما هو المرجع القانوني لهذه المسطرة؟', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (57, NULL, N'', N'ما هي دراسة التأثير على البيئة؟', N'2', NULL, NULL, 4)
INSERT [dbo].[question] ([id_question], [delete_date_time], [description], [description_ar], [type], [id_autorisation], [compte_id], [id_evaluation]) VALUES (58, CAST(N'2021-02-22T09:06:44.5010000' AS DateTime2), N'ppp', N'', N'1', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[contact_message] ON 

INSERT [dbo].[contact_message] ([id_message], [date], [delete_date_time], [heur], [message], [reponse], [sujet], [type_msg], [compte_id], [email], [nom], [numtel], [prenom]) VALUES (1, N'03/02/2021', NULL, N'10 : 43', N'message', NULL, N'objet', N'1', 1023, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[contact_message] OFF
GO
SET IDENTITY_INSERT [dbo].[reponse] ON 

INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (43, N'15-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'10 : 19', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (44, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="${pageContext.request.contextPath}/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental. 

	</p>
', N'10 : 31', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (45, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement
		<b>EIE</b> : Etude d’Impact sur l’Environnement
		<b>EP</b> : Enquête publique
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental. 

	</p>', N'10 : 35', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (46, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>', N'10 : 47', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (47, N'15-02-2021', NULL, N'<ol>
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 49', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (48, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 50', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (49, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>', N'10 : 56', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (50, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;">EIE :</h5>Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>', N'10 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (51, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>', N'10 : 59', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (52, N'15-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Selon la loi 12-03 :
<ol class="style_number ml-2">
		<li> Une description globale de l''état initial du site susceptible d''être affecté par le projet, notamment ses composantes biologique, physique et humaine ; </li>
		<li> Une description des principales composantes, caractéristiques et étapes de réalisation du projet y compris les procédés de fabrication, la nature et les quantités de matières premières et les ressources d''énergie utilisées, les rejets liquides, gazeux et solides ainsi que les déchets engendrés par la réalisation ou l''exploitation du projet ; </li>
		<li> Une évaluation des impacts positifs, négatifs et nocifs du projet sur le milieu biologique, physique et humain pouvant être affecté durant les phases de réalisation, d''exploitation ou de son développement sur la base des termes de références et des directives prévues à cet effet ;  </li>
		<li> Les mesures envisagées par le pétitionnaire pour supprimer, réduire ou compenser les conséquences dommageables du projet sur l''environnement ainsi que les mesures visant à mettre en valeur et à améliorer les impacts positifs du projet ;  </li>
		<li> Un programme de surveillance et de suivi du projet ainsi que les mesures envisagées en matière de formation, de communication et de gestion en vue d''assurer l''exécution, l''exploitation et le développement conformément aux prescriptions techniques et aux exigences environnementales adoptées par l’étude ;  </li>
		<li> Une présentation concise portant sur le cadre juridique et institutionnel afférent au projet et à l''immeuble dans lequel sera exécuté et exploité ainsi que les coûts prévisionnels du projet ; </li>
		<li> Une note de synthèse récapitulant le contenu et les conclusions de l’étude ; </li>
		<li> Un résumé simplifié des informations et des principales données contenues dans l''étude destiné au public. </li>
		
	</ol>

<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'11 : 0', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (53, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 8', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (54, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels:  </li>
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 14', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (55, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 15', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (56, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 20', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (57, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 </li>
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 23', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (58, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ul>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 26', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (59, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3 style_number_sub">
				<li>
					<ol class="">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 28', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (60, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol start="3" class="style_number_sub">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 30', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (61, N'15-02-2021', NULL, N'<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number_sub">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ol>
			</li>
				
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 32', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (62, N'15-02-2021', NULL, N'<ol class="style_number style_number_sub">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 34', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (63, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		<p>
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		</p>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 35', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (64, N'15-02-2021', NULL, N'	<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number_sub" start="3">
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 36', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (65, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number" >
				<li>
					<ol class="style_number_sub">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 39', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (66, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			
			<ol class="">
				<li> Industrie extractive  </li>
				<li> Industrie de l''énergie  </li>
				<li> Industrie chimique  </li>
				<li> Traitement des métaux  </li>
				<li> Industrie des produits alimentaires  </li>
				<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
				<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
			</ol>
				
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 41', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (67, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: 
		
			<ol class="style_number style_number_sub" start="3">
				<li>
					<ol class=" style_number style_number_sub" start="3">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		</li>
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 43', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (68, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		
			<ol class="style_number style_number_sub">
				<li>
					<ol class=" style_number style_number_sub" start="3">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>
', N'11 : 44', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (69, N'15-02-2021', NULL, N'<ol class="style_number">
		<li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
		<li class="text-success"> Projets d''infrastructures :  </li>
		<p>
			<ul class="style_square">
				<li> Construction de routes (routes nationales et autoroutes) ;  </li>
				<li> Voies ferrées ; </li>
				<li> Aéroports  </li>
				<li> Aménagement de zones urbaines  </li>
				<li> Aménagement de zones industrielles  </li>
				<li> Ports de commerce et ports de plaisance  </li>
				<li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
				<li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
				<li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
				<li> Stations d''épuration des eaux usées et ouvrages annexes </li>
				<li> Emissaires d''évacuation marin </li>
				<li> Transport de matières dangereuses ou toxiques </li>
			</ul>
		</p>
		<li class="text-success"> Projets industriels: </li>
		
			<ol class="style_number style_number_sub" start="3">
				<li>
					<ol class=" style_number style_number_sub" start="1">
						<li> Industrie extractive  </li>
						<li> Industrie de l''énergie  </li>
						<li> Industrie chimique  </li>
						<li> Traitement des métaux  </li>
						<li> Industrie des produits alimentaires  </li>
						<li> Industrie textile, du cuir, du bois, du papier, de carton et de poterie  </li>
						<li> Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères </li>
					</ol>
				</li>
			</ol>
		
		
		 
		<li class="text-success"> Agriculture : </li>
		<li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
	</ol>', N'11 : 44', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (70, N'15-02-2021', NULL, N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p>3.1 - Industrie extractive </p>
        <p>3.2 - Industrie de l''énergie : </p>
        <p>3.3 - Industrie chimique  </p>
        <p>3.4 - Traitement des métaux :  </p>
        <p>3.5 - Industrie des produits alimentaires :  </p>
        <p>3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <p>3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>', N'11 : 51', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (71, N'15-02-2021', NULL, N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p>3.1 - Industrie extractive </p>
        <ul class="style_square">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p>3.2 - Industrie de l''énergie : </p>
        <ul class="style_square">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p>3.3 - Industrie chimique  </p>
        <ul class="style_square">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
        </ul>
        <p>3.4 - Traitement des métaux :  </p>
        <ul class="style_square">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p>3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p>3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p>3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>
    
    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>', N'11 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (72, N'15-02-2021', NULL, N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p class="pb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="pb-1">3.2 - Industrie de l''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="pb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
        </ul>
        <p class="pb-1">3.4 - Traitement des métaux :  </p>
        <ul class="style_square ml-5">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p class="pb-1">3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square ml-5">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p class="pb-1">3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square ml-5">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p class="pb-1">3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>

    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>', N'12 : 1', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (73, N'15-02-2021', NULL, N'<ol class="style_number">
    <li class="text-success"> Etablissements insalubres, incommodes ou dangereux classés en première catégorie.  </li>
    <li class="text-success"> Projets d''infrastructures :  </li>
    <p>
        <ul class="style_square">
            <li> Construction de routes (routes nationales et autoroutes) ;  </li>
            <li> Voies ferrées ; </li>
            <li> Aéroports  </li>
            <li> Aménagement de zones urbaines  </li>
            <li> Aménagement de zones industrielles  </li>
            <li> Ports de commerce et ports de plaisance  </li>
            <li> Barrages ou toutes autres installations destinées à retenir et à stocker les eaux d''une manière permanente  </li>
            <li> Complexes touristiques, notamment ceux situés au littoral, à la montagne et en milieu rural  </li>
            <li> Installations de stockage ou d''élimination de déchets quel que soit leur nature et la méthode de leur élimination  </li>
            <li> Stations d''épuration des eaux usées et ouvrages annexes </li>
            <li> Emissaires d''évacuation marin </li>
            <li> Transport de matières dangereuses ou toxiques </li>
        </ul>
    </p>
    <li class="text-success"> Projets industriels: </li>
    <div>
        <p class="pb-1mb-1">3.1 - Industrie extractive </p>
        <ul class="style_square ml-5">
            <li> Mines </li>
            <li> Carrières de sable et gravier </li>
            <li> Cimenteries </li>
            <li> Industrie de plâtre </li>
            <li> Transformation du liège </li>
        </ul>
        <p class="mb-1">3.2 - Industrie de l''énergie : </p>
        <ul class="style_square ml-5">
            <li> Installations destinées au stockage du gaz et tous produits inflammables ;  </li>
            <li> Raffineries de pétrole ;  </li>
            <li> Grands travaux de transfert d’énergie ;  </li>
            <li> Centrales thermiques et autres installations à combustion puissance calorifique d''au moins 300 MW ;  </li>
            <li> Centrales nucléaires ; </li>
            <li> Centrales hydroélectriques </li>
        </ul>
        <p class="mb-1">3.3 - Industrie chimique  </p>
        <ul class="style_square ml-5">
            <li> Installations de fabrication de produits chimiques, de pesticides, de produits pharmaceutiques, de peintures de vernis, d''élastomères et peroxydes </li>
            <li> Lancement de nouveaux produits chimiques sur le marché </li>
            <li> Extraction, traitement et transformation d''amiante </li>
        </ul>
        <p class="mb-1">3.4 - Traitement des métaux :  </p>
        <ul class="style_square ml-5">
            <li> Usines sidérurgiques </li>
            <li> Traitement de surface et revêtement des métaux </li>
            <li> Chaudronnerie et appareils métalliques </li>
        </ul>
        <p class="mb-1">3.5 - Industrie des produits alimentaires :  </p>
        <ul class="style_square ml-5">
            <li>Conserverie de produits animal et végétal ; </li>
            <li>Fabrication de produits laitiers ; </li>
            <li>Fabrication de confiseries et de boissons ; </li>
            <li>Usines de farine de poisson et d''huile de poisson ; </li>
            <li>Féculerie industrielle ;</li>
            <li>Sucreries et transformation de mélasses ; </li>
            <li>Minoteries et semouleries ; </li>
            <li>Huileries. </li>
        </ul>
        <p class="mb-1">3.6 - Industrie textile, du cuir, du bois, du papier, de carton et de poterie :  </p>
        <ul class="style_square ml-5">
            <li>Fabrication de pâte à papier, de papier et de carton ; </li>
            <li>Tanneries et mégisserie ; </li>
            <li>Production et traitement de cellulose ; </li>
            <li>Teinturerie de fibres ; </li>
            <li>Fabrication de panneaux de fibres, de particules et de contre-plaqués ; </li>
            <li>Industrie de textile et teintureries ; </li>
            <li>Poterie. </li>
        </ul>
        <p class="mb-1">3.7 - Industrie de caoutchouc : Fabrication et traitement de produits à base d''élastomères.  </p>
    </div>




    <li class="text-success"> Agriculture : </li>
    <p>
        <ul class="style_square">
            <li>Projets de remembrement rural ; </li>
            <li>Projets de reboisement d''une superficie supérieur à 100 hectares ; </li>
            <li>Projets d''affectation de terre inculte ou d''étendue semi-naturelle à l''exploitation agricole intensive. </li>
        </ul>
    </p>

    <li class="text-success"> Projets d''aquaculture et de pisciculture. </li>
</ol>', N'12 : 3', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (74, N'15-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'12 : 5', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (75, N'15-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'12 : 5', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (76, N'15-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'12 : 6', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (77, N'15-02-2021', NULL, N'reponse 3', N'12 : 27', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (78, N'15-02-2021', NULL, N'reponse 2', N'12 : 28', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (79, N'19-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'16 : 20', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (80, N'19-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'17 : 30', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (81, N'19-02-2021', NULL, N'	 <img src="/assets/images/arab_5.png">
', N'17 : 42', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (82, N'19-02-2021', NULL, N'
	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'17 : 48', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (83, N'19-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'17 : 56', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (84, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'17 : 57', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (85, N'19-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'17 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (86, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 2', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (87, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 3', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (88, N'19-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'18 : 32', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (89, N'19-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'18 : 32', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (90, N'19-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'18 : 32', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (91, N'19-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'18 : 32', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (92, N'20-02-2021', NULL, N'poipoio', N'17 : 45', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (93, N'22-02-2021', NULL, N'تشكل دراسة التأثير على البيئة أداة وقائية تدخل في إطار سياسة حماية البيئة. و هي دراسة قبلية تمكن من تقييم الآثار المباشرة وغير المباشرة التي يمكن أن تلحق البيئة على الأمد القصير والمتوسط والبعيد نتيجة إنجاز المشاريع الاقتصادية والتنموية وتشييد التجهيزات الأساسية وتحديد التدابير الكفيلة بإزالة التأثيرات السلبية أو التخفيف منها أو تعويضها بما يساعد على تحسين الآثار الإيجابية للمشروع على البيئة.', N'10 : 57', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (94, N'22-02-2021', NULL, N'<ul class="style_square">
    <li> قانون 12-03 المتعلق بدراسات التأثير على البيئة. </li>
    <li> المرسوم التطبيقي رقم 2-04-563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة. </li>
    <li>المرسوم التطبيقي رقم 2-04-564 الذي يحدد كيفية تنظيم البحث العمومي المتعلق بالمشاريع الخاضعة لدراسات التأثير على البيئة. </li>
</ul>', N'10 : 57', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (95, N'22-02-2021', NULL, N'انظر اللائحة المشاريع الخاضعة لدراسة التأثير على البيئة المرفقة بالقانون 12-03 المتعلق بدراسة التأثير على البيئة.', N'10 : 57', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (96, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
    <li class="text-underline" > رنامج المراقبة والتتبع البيئي: وثيقة قابلة للتحميل </li>
</ol>
', N'10 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (97, N'22-02-2021', NULL, N'<div>
    <ol>
        <li> استمارة الإشعار بالمشروع: أنظر النموذج على الموقع.</li>
        <li> البحث العمومي: انظر ظهير رقم 2-04-564   ل 5 دي القعدة 1429 الموافق 4 نونبر 2008 الدي ينظم ويحدد شروط البحث العموم الخاص للمشاريع المعنية   بدراسة التأثير على البيئة.</li>
        <li> دراسة التأثير على البيئة.</li>
        <li>برنامج المراقبة والتتبع البيئي أو كناش التحملات البيئي. </li>
    </ol>
</div>', N'10 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (98, N'22-02-2021', NULL, N' <img src="/assets/images/arab_6.png">', N'10 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (99, N'22-02-2021', NULL, N'Les dispositions réglementaires définissent l’EIE comme un instrument préventif de gestion et de protection de l’environnement. Elle doit être préalable à l’autorisation de réalisation du projet et permettre « d’évaluer les impacts directs ou indirects pouvant porter atteinte à l’environnement à court, moyen et long terme suite à la réalisation de projets économiques et de développement et à la mise en place des infrastructures de base et de déterminer des mesures pour supprimer, atténuer ou compenser les impacts négatifs et de capitaliser et d''améliorer les impacts positifs du projet sur l’environnement »', N'10 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (100, N'22-02-2021', NULL, N'Voir la liste d’assujettissement annexée à la loi n°12-03 relative aux études d''impact sur l''environnement.', N'10 : 58', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (101, N'22-02-2021', NULL, N'<ul class="style_square">	
	<li>Loi n° 12-03 Relative aux études d''impact sur l''environnement ;</li>
	<li>Décret n°2-04-563 relatif aux attributions et au fonctionnement du CNEI et des CREI ;</li>
	<li>Décret n° 2-04-564 fixant les modalités d’organisation et de déroulement de l’enquête publique.</li>
</ul>', N'10 : 59', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (102, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;">Schéma simplifié de la procédure des EIE</h5>
	<img src="/assets/images/question_organi.png">
	<p>
		<b>CNEI</b> : Comité national des ÉIE<br>
		<b>CRUI</b> : Commission Régionale Unifiée d’Investissement<br>
		<b>EIE</b> : Etude d’Impact sur l’Environnement<br>
		<b>EP</b> : Enquête publique<br>
		<b>PSSE/CC</b> : Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges Environnemental.
	</p>', N'10 : 59', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (103, N'22-02-2021', NULL, N'<ol class="style_number">
		<li>Conclusions de l’enquête publique ;</li>
		<li>Rapport de l’EIE ;</li>
		<li>Programme de Suivi et de Surveillance Environnementale ou Cahier des Charges nvironnementales. </li>
	</ol>', N'10 : 59', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (104, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<h5 style="text-decoration: underline;display: inline;">PSSE :</h5> Document téléchargeable.', N'10 : 59', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (105, N'22-02-2021', NULL, N'Il n’y a pas de frais exigés par l’administration pour l’instruction d’un dossier EIE. Cependant les documents de l’EIE et les frais de l’enquête publique (la publication de l’arrêté de l’enquête publique, les documents techniques et les registres) sont à la charge du pétitionnaire selon le Décret n° 2-04-564 du 5 kaada 1429 (4 novembre 2008) fixant les modalités d''organisation et de déroulement de l''enquête publique relative aux projets soumis aux études d''impact sur l''environnement.', N'11 : 0', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (106, N'22-02-2021', NULL, N'	 
<ol>
    <li class="text-underline" > 	دراسة التأثير على البيئة: </li>
    <img src="/assets/images/arab_5.png">
   <li class="text-underline" > <a href="/assets/images/arab_5.png" download="doc.png" target="_blank">برنامج المراقبة والتتبع البيئي</a> </li>
</ol>
', N'11 : 2', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (107, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (108, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank"></a>Document téléchargeable.</p>', N'11 : 30', NULL)
INSERT [dbo].[reponse] ([id_reponse], [date_pub], [delete_date_time], [description], [heur_pub], [compte_id]) VALUES (109, N'22-02-2021', NULL, N'<h5 style="text-decoration: underline;display: inline;">EIE :</h5> Le contenu réglementaire de l’ÉIE
<img src="/assets/images/FR00.png">
<p><h5 style="text-decoration: underline;display: inline;">PSSE :</h5> <a href="/assets/images/FR00.png" download="doc.png" targer="_blank">Document téléchargeable.</a></p>', N'11 : 32', NULL)
SET IDENTITY_INSERT [dbo].[reponse] OFF
GO
SET IDENTITY_INSERT [dbo].[list_doc_notif] ON 

INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (1, NULL, N'oui', NULL, N'/assets/myFile/file1244.pdf', 9, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (2, NULL, N'oui', NULL, N'/assets/myFile/file1107.pdf', 8, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (3, NULL, N'oui', NULL, N'/assets/myFile/file1310.pdf', 7, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (4, NULL, N'oui', NULL, N'/assets/myFile/file1297.pdf', 6, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (5, NULL, N'oui', NULL, N'/assets/myFile/file676.pdf', 5, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (6, NULL, N'oui', NULL, N'/assets/myFile/file1381.pdf', 4, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (7, NULL, N'oui', NULL, N'/assets/myFile/file563.pdf', 3, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (8, NULL, N'oui', NULL, N'/assets/myFile/file982.pdf', 2, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (9, NULL, N'oui', NULL, N'/assets/myFile/file1147.pdf', 1, 3, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (10, NULL, N'oui', N'   valider ', N'/assets/myFile/file954.pdf', 9, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (11, NULL, N'oui', NULL, N'/assets/myFile/file763.pdf', 8, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (12, NULL, N'oui', NULL, N'/assets/myFile/file558.pdf', 7, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (13, NULL, N'oui', NULL, N'/assets/myFile/file1257.pdf', 6, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (14, NULL, N'oui', NULL, N'/assets/myFile/file640.pdf', 5, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (15, NULL, N'oui', NULL, N'/assets/myFile/file891.pdf', 4, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (16, NULL, N'oui', NULL, N'/assets/myFile/file613.pdf', 3, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (17, NULL, N'oui', NULL, N'/assets/myFile/file761.pdf', 2, 5, NULL, NULL)
INSERT [dbo].[list_doc_notif] ([id_list_doc_notif], [delete_date_time], [nom_ar], [nom_fr], [url], [iddoc_import], [id_notification], [id_collecte], [id_installation]) VALUES (18, NULL, N'oui', NULL, N'/assets/myFile/file1446.pdf', 1, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[list_doc_notif] OFF
GO
SET IDENTITY_INSERT [dbo].[region] ON 

INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr], [dater]) VALUES (1, NULL, N'جهة طنجة تطوان الحسيمة', N'Tanger', NULL)
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr], [dater]) VALUES (2, NULL, N'جهة الشرق', N'Oriental', NULL)
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr], [dater]) VALUES (3, NULL, N'جهة فاس مكناس', N'Fès-Boulemane', NULL)
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr], [dater]) VALUES (4, NULL, N'جهة الدار البيضاء سطات', N'Grand Casablanca', NULL)
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr], [dater]) VALUES (5, NULL, N'جهة مراكش آسفي', N'Marrakech-Tensift-Al Haouz ', NULL)
INSERT [dbo].[region] ([region_id], [delete_date_time], [nom_ar], [nom_fr], [dater]) VALUES (6, NULL, N'جهة سوس ماسة', N'Souss-Massa-Drâa ', NULL)
SET IDENTITY_INSERT [dbo].[region] OFF
GO
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (1, 2)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (1, 3)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (2, 1)
INSERT [dbo].[region_demande] ([id_demande_information], [id_region]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[reunion] ON 

INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (1, N'2021-01-29', NULL, NULL, NULL, N'Nom Réunion ', NULL, 1, NULL)
INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (2, N'2021-01-27', NULL, NULL, NULL, N'Nom Réunion ', N'oui', 2, NULL)
INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (3, N'2021-01-30', NULL, NULL, NULL, N'Nom Réunion ', NULL, 2, NULL)
INSERT [dbo].[reunion] ([id_reunion], [date_reunion], [delete_date_time], [description], [nom_ar], [nom_fr], [reporte], [demande_information_id], [reunion_ids]) VALUES (4, N'2021-01-13', NULL, NULL, NULL, N'Nom Réunion ', NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[reunion] OFF
GO
SET IDENTITY_INSERT [dbo].[import_historique] ON 

INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (1, CAST(N'2021-01-22T09:25:41.0120000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (2, CAST(N'2021-01-22T09:25:44.1360000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (3, CAST(N'2021-01-22T09:25:47.2960000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (4, CAST(N'2021-01-22T09:25:52.1260000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (5, CAST(N'2021-01-22T09:25:55.4050000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (6, CAST(N'2021-01-22T09:25:59.5660000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (7, CAST(N'2021-01-22T09:26:03.6240000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (8, CAST(N'2021-01-22T09:26:07.7970000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (9, CAST(N'2021-01-22T09:26:11.6840000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (10, CAST(N'2021-01-22T09:28:38.6020000' AS DateTime2), N'non conforme', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (11, CAST(N'2021-01-22T09:28:58.3190000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (12, CAST(N'2021-01-22T09:29:01.1510000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (13, CAST(N'2021-01-22T09:29:04.0210000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (14, CAST(N'2021-01-22T09:29:07.8500000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (15, CAST(N'2021-01-22T09:29:10.8230000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (16, CAST(N'2021-01-22T09:29:13.9510000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (17, CAST(N'2021-01-22T09:29:17.4000000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (18, CAST(N'2021-01-22T09:31:19.8790000' AS DateTime2), N'non conforme', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (19, CAST(N'2021-01-22T09:33:23.5090000' AS DateTime2), N'en attente', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (20, CAST(N'2021-01-22T09:33:50.9880000' AS DateTime2), N'avis de commerce', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (21, CAST(N'2021-01-22T09:34:05.1040000' AS DateTime2), N'valide', 3, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (22, CAST(N'2021-01-22T10:42:33.1310000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (23, CAST(N'2021-01-22T10:42:38.2920000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (24, CAST(N'2021-01-22T10:42:43.8770000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (25, CAST(N'2021-01-22T10:42:48.3410000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (26, CAST(N'2021-01-22T10:42:55.5860000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (27, CAST(N'2021-01-22T10:43:00.4890000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (28, CAST(N'2021-01-22T10:43:07.8550000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (29, CAST(N'2021-01-22T10:43:11.9260000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (30, CAST(N'2021-01-22T10:43:24.7870000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (31, CAST(N'2021-01-22T10:46:18.9940000' AS DateTime2), N'non conforme', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (32, CAST(N'2021-01-22T10:46:46.8890000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (33, CAST(N'2021-01-22T10:46:51.3480000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (34, CAST(N'2021-01-22T10:46:56.3640000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (35, CAST(N'2021-01-22T10:47:01.3810000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (36, CAST(N'2021-01-22T10:47:08.9930000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (37, CAST(N'2021-01-22T10:47:16.8110000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (38, CAST(N'2021-01-22T10:47:20.8240000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (39, CAST(N'2021-01-22T10:47:26.7190000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (40, CAST(N'2021-01-22T10:47:30.7320000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (41, CAST(N'2021-01-22T10:48:27.2970000' AS DateTime2), N'non conforme', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (42, CAST(N'2021-01-22T10:48:57.0480000' AS DateTime2), N'en attente', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (43, CAST(N'2021-01-22T10:49:16.2760000' AS DateTime2), N'avis de commerce', 5, NULL, NULL)
INSERT [dbo].[import_historique] ([id_historique], [date], [etat], [id_notification], [id_collecte], [id_installation]) VALUES (44, CAST(N'2021-01-22T10:49:35.8640000' AS DateTime2), N'valide', 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[import_historique] OFF
GO
INSERT [dbo].[notif_tranport] ([id_notification], [id_transporteur]) VALUES (3, 5)
INSERT [dbo].[notif_tranport] ([id_notification], [id_transporteur]) VALUES (3, 11)
INSERT [dbo].[notif_tranport] ([id_notification], [id_transporteur]) VALUES (3, 14)
INSERT [dbo].[notif_tranport] ([id_notification], [id_transporteur]) VALUES (5, 7)
INSERT [dbo].[notif_tranport] ([id_notification], [id_transporteur]) VALUES (5, 15)
INSERT [dbo].[notif_tranport] ([id_notification], [id_transporteur]) VALUES (5, 17)
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [nom], [nom_fr]) VALUES (1, N'ADMIN', N'ROLE_ADMIN')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[profilerole] ON 

INSERT [dbo].[profilerole] ([profilrole_id], [annuler], [modifier], [tous], [valider], [profil_id], [role_id]) VALUES (1, N'oui', N'oui', N'oui', N'oui', 1, 1)
SET IDENTITY_INSERT [dbo].[profilerole] OFF
GO
SET IDENTITY_INSERT [dbo].[comite] ON 

INSERT [dbo].[comite] ([comite_id], [adresse], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [permanent]) VALUES (1, N'ADRESE', NULL, N'amal.kabkab@gmail.com', N'اللجنة', N'comité', N'06666', N'Regionale', 6, NULL)
INSERT [dbo].[comite] ([comite_id], [adresse], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [permanent]) VALUES (2, N'S', NULL, N'S', N'S', N'S', N'0676767676', N'Regionale', 4, NULL)
INSERT [dbo].[comite] ([comite_id], [adresse], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [permanent]) VALUES (3, N'ff', NULL, N'ff', N'ff', N'ff', N'f', N'Nationale', 6, NULL)
INSERT [dbo].[comite] ([comite_id], [adresse], [delete_date_time], [email], [nom_comite_ar], [nom_comite_fr], [tel], [type], [id_region], [permanent]) VALUES (4, N's', NULL, N's', N'ss', N's', N'', N'Regionale', 6, NULL)
SET IDENTITY_INSERT [dbo].[comite] OFF
GO
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (42, 105)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (43, 102)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (46, 100)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (47, 101)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (48, 99)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (49, 77)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (50, 78)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (51, 98)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (44, 103)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (45, 109)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (53, 97)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (54, 106)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (55, 95)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (56, 94)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (57, 93)
INSERT [dbo].[question_reponse] ([id_question], [id_reponse]) VALUES (58, 92)
GO
SET IDENTITY_INSERT [dbo].[operation] ON 

INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (1, N'D1', NULL, NULL, N'Dépôt sur ou dans le sol (par ex., mise en décharge, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (2, N'D2', NULL, NULL, N'Traitement en milieu terrestre (par ex., biodégradation de déchets liquides ou de boues dans les sols, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (3, N'D3', NULL, NULL, N'Injection en profondeur (par ex., injection des déchets pompables dans des puits, des dômes de sel ou des failles géologiques naturelles, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (4, N'D4', NULL, NULL, N'Lagunage (par ex., déversement de déchets liquides ou de boues dans des puits, des étangs ou des bassins, etc.) ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (5, N'D5', NULL, NULL, N'Mise en décharge spécialement aménagée (par ex., placement dans des alvéoles étanches séparées, recouvertes et isolées les unes des autres et de l''environnement, etc.)', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (6, N'D6', NULL, NULL, N'Rejet dans le milieu aquatique excepté les mers ou océans', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (7, N'D7', NULL, NULL, N'Rejet dans les mers ou océans, y compris enfouissement dans le sous-sol marin ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (8, N'D8', NULL, NULL, N'Traitement biologique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l''un des procédés de cette liste ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (9, N'D9', NULL, NULL, N'Traitement physico-chimique non spécifié ailleurs dans cette liste, aboutissant à des composés ou à des mélanges qui sont éliminés selon l''un des procédés de cette liste (par ex., évaporation, séchage, calcination, etc.) ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (10, N'D10', NULL, NULL, N'Incinération à terre ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (11, N'D11', NULL, NULL, N'Incinération en mer', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (12, N'D12', NULL, NULL, N'Stockage permanent (par ex., placement de conteneurs dans une mine, etc.) ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (13, N'D13', NULL, NULL, N'Mélange ou regroupement préalablement à l''une des opérations de cette liste ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (14, N'D14', NULL, NULL, N'Reconditionnement préalablement à l''une des opérations de cette liste ', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (15, N'D15', NULL, NULL, N'Stockage préalablement à l''une des opérations de cette liste', N'ELIMINATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (16, N'R1', NULL, NULL, N'Utilisation comme combustible (autrement qu''en incinération directe) ou autre moyen de produire de l''énergie/utilisé principalement comme combustible ou autre moyen de produire de l’énergie', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (17, N'R2', NULL, NULL, N'Récupération ou régénération des solvants', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (18, N'R3', NULL, NULL, N'Recyclage ou récupération des substances organiques qui ne sont pas utilisées comme solvants', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (19, N'R4', NULL, NULL, N'Recyclage ou récupération des métaux ou des composés métalliques', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (20, N'R5', NULL, NULL, N'Recyclage ou récupération d''autres matières inorganiques', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (21, N'R6', NULL, NULL, N'Régénération des acides ou des bases', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (22, N'R7', NULL, NULL, N'Récupération des produits servant à capter les polluants', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (23, N'R8', NULL, NULL, N'Récupération des produits provenant des catalyseurs', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (24, N'R9', NULL, NULL, N'Régénération ou autres réemplois des huiles usées', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (25, N'R10', NULL, NULL, N'Épandage sur le sol au profit de l''agriculture ou de l''écologie', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (26, N'R11', NULL, NULL, N'Utilisation de matériaux résiduels obtenus à partir de l''une des opérations numérotées de R1 à R10', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (27, N'R12', NULL, NULL, N'Échange de déchets en vue de les soumettre à l''une quelconque des opérations numérotées de R1 à R1 1', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (28, N'R13', NULL, NULL, N'Stockage de matériaux en vue de les soumettre à l''une des opérations de cette liste.', N'VALORISATION')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (29, N'Hl', NULL, NULL, N'Matières explosives', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (30, N'H3', NULL, NULL, N'Matières liquides inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (31, N'H4.1', NULL, NULL, N'Matières solides inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (32, N'H4.2', NULL, NULL, N'Matières spontanément inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (33, N'H4.3', NULL, NULL, N'Matières qui, au contact de l''eau, émettent des gaz inflammables', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (34, N'H5.1', NULL, NULL, N'Matières comburantes', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (35, N'H5.2', NULL, NULL, N'Peroxydes organiques', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (36, N'H6.1', NULL, NULL, N'Matières toxiques (aiguës)', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (37, N'H6.2', NULL, NULL, N'Matières infectieuses', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (38, N'H8', NULL, NULL, N'Matières corrosives', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (39, N'H10', NULL, NULL, N'Matières libérant des gaz toxiques au contact de l''air ou de l''eau', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (40, N'H11', NULL, NULL, N'Matières toxiques (effets différés ou chroniques)', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (41, N'H12', NULL, NULL, N'Matières écotoxiques', N'Code_H')
INSERT [dbo].[operation] ([id_operation], [code], [delete_date_time], [nom_ar], [nom_fr], [type]) VALUES (42, N'H13', NULL, NULL, N'Matières susceptibles après élimination de donner lieu, par quelque moyen que ce soit, à une autre substance, par ex. un produit de lixiviation, qui possède l''une des caractéristiques énumérées ci-dessus', N'Code_H')
SET IDENTITY_INSERT [dbo].[operation] OFF
GO
