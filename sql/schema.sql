-- Base de données : `projet_jdr`

CREATE TABLE Role (
  nom_role varchar(20) PRIMARY KEY NOT NULL,
  duree_role int(11) DEFAULT NULL
);

CREATE TABLE Mission (
  nom_mission varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE JDR (
  nom_jeu varchar(20) PRIMARY KEY NOT NULL,
  duree_role int(11) DEFAULT NULL
);

CREATE TABLE Disponibilite (
  date_deb date NOT NULL,
  date_fin date NOT NULL,
  PRIMARY KEY (date_deb, date_fin)
);

CREATE TABLE Materiel (
  nom_m varchar(20) PRIMARY KEY NOT NULL,
  quantite int(11) DEFAULT NULL
);

CREATE TABLE Association (
  nom_asso varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE Pays(
  nom_pays varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE Ville(
  nom_ville varchar(20) PRIMARY KEY NOT NULL,
  nom_pays varchar(20) NOT NULL,
  FOREIGN KEY fk_pays(nom_pays) REFERENCES Pays(nom_pays)
);

CREATE TABLE Adresse(
  code_a int(11) PRIMARY KEY NOT NULL,
  num_rue int(11),
  nom_ville varchar(20) NOT NULL,
  FOREIGN KEY fk_ville(nom_ville) REFERENCES Ville(nom_ville)
);

CREATE TABLE Salle(
  num_salle int(11) PRIMARY KEY NOT NULL,
  surface int(11),
  code_a int(11) NOT NULL,
  FOREIGN KEY fk_adresse(code_a) REFERENCES Adresse(code_a)
);

CREATE TABLE Participant(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom varchar(20) NOT NULL,
  prenom varchar(20) NOT NULL,
  motivation text,
  experience text,
  nom_asso varchar(20) NOT NULL,
  code_a int(11) NOT NULL,
  FOREIGN KEY fk_association(nom_asso) REFERENCES Association(nom_asso),
  FOREIGN KEY fk_adresse(code_a) REFERENCES Adresse(code_a)
);

CREATE TABLE Partenaire (
  id1 INT NOT NULL,
  id2 INT NOT NULL,
  lien varchar(20) DEFAULT NULL,
  PRIMARY KEY (id1, id2),
  FOREIGN KEY(id1) REFERENCES Participant(id),
  FOREIGN KEY(id2) REFERENCES Participant(id)
);

CREATE TABLE Ass_role_participant(
  id INT NOT NULL,
  nom_role varchar(20) NOT NULL,
  date date DEFAULT NULL,
  PRIMARY KEY (id, nom_role),
  FOREIGN KEY(id) REFERENCES Participant(id),
  FOREIGN KEY(nom_role) REFERENCES Role(nom_role)
);

CREATE TABLE Ass_mission_role(
  nom_mission varchar(20) NOT NULL,
  nom_role varchar(20) NOT NULL,
  duree int(11) DEFAULT NULL,
  PRIMARY KEY (nom_mission, nom_role),
  FOREIGN KEY(nom_mission) REFERENCES Mission(nom_mission),
  FOREIGN KEY(nom_role) REFERENCES Role(nom_role)
);

CREATE TABLE Ass_JDR_mission(
  nom_mission varchar(20) NOT NULL,
  nom_jeu varchar(20) NOT NULL,
  PRIMARY KEY (nom_mission, nom_jeu),
  FOREIGN KEY(nom_mission) REFERENCES Mission(nom_mission),
  FOREIGN KEY(nom_jeu) REFERENCES JDR(nom_jeu)
);

CREATE TABLE Ass_salle_JDR(
  num_salle int(11)  NOT NULL,
  nom_jeu varchar(20) NOT NULL,
  theme varchar(20) NOT NULL,
  PRIMARY KEY (num_salle, nom_jeu),
  FOREIGN KEY(num_salle) REFERENCES Salle(num_salle),
  FOREIGN KEY(nom_jeu) REFERENCES JDR(nom_jeu)
);

CREATE TABLE Ass_dispo_salle(
  num_salle int(11)  NOT NULL,
  date_deb date NOT NULL,
  date_fin date NOT NULL,
  PRIMARY KEY (num_salle, date_deb, date_fin),
  FOREIGN KEY(num_salle) REFERENCES Salle(num_salle),
  FOREIGN KEY(date_deb, date_fin) REFERENCES Disponibilite(date_deb, date_fin)
);

CREATE TABLE Ass_dispo_participant(
  id int NOT NULL,
  date_deb date NOT NULL,
  date_fin date NOT NULL,
  PRIMARY KEY (id, date_deb, date_fin),
  FOREIGN KEY(id) REFERENCES Participant(id),
  FOREIGN KEY(date_deb, date_fin) REFERENCES Disponibilite(date_deb, date_fin)
);

CREATE TABLE Ass_materiel_salle(
  num_salle int(11)  NOT NULL,
  nom_m varchar(20) NOT NULL,
  PRIMARY KEY (num_salle, nom_m),
  FOREIGN KEY(num_salle) REFERENCES Salle(num_salle),
  FOREIGN KEY(nom_m) REFERENCES Materiel(nom_m)
);

CREATE TABLE Ass_asso_participant(
  nom_asso varchar(20)  NOT NULL,
  id int NOT NULL,
  PRIMARY KEY (nom_asso, id),
  FOREIGN KEY(nom_asso) REFERENCES Association(nom_asso),
  FOREIGN KEY(id) REFERENCES Participant(id)
);
