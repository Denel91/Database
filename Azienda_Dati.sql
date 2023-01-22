start transaction;
set constraints all deferred;

insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('John','Smith', '123456789', '1965-01-09', '731 Fonfren, Houston, TX', 'M', 30000, '333445555', 5);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('Franklin', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('Alicia', 'Zelaya', '999887777', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('Jennifer', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('Ramesh', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('Joyce', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('Ahmad', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
insert into impiegato (nome, cognome, ssn, data_nascita, indirizzo, sesso, stipendio, super_ssn, numero_dipartimento)
VALUES ('James', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, null, 1);

insert into dipartimento (nome_dipartimento, numero_dipartimento, ssn_dir, data_inizio_dir)
VALUES ('Ricerca', 5, '333445555', '1988-05-22');
insert into dipartimento (nome_dipartimento, numero_dipartimento, ssn_dir, data_inizio_dir)
VALUES ('Amministrazione', 4, '987654321', '1995-01-01');
insert into dipartimento (nome_dipartimento, numero_dipartimento, ssn_dir, data_inizio_dir)
VALUES ('Sede Centrale', 1, '888665555', '1981-06-19');

insert into sedi_dipartimento (numero_dipartimento, sede_dipartimento)
VALUES(1, 'Houston');
insert into sedi_dipartimento (numero_dipartimento, sede_dipartimento)
VALUES(4, 'Stafford');
insert into sedi_dipartimento (numero_dipartimento, sede_dipartimento)
VALUES(5, 'Bellaire');
insert into sedi_dipartimento (numero_dipartimento, sede_dipartimento)
VALUES(5, 'Sugarland');
insert into sedi_dipartimento (numero_dipartimento, sede_dipartimento)
VALUES(5, 'Houston');

insert into progetto (nome_progetto, numero_progetto, sede_progetto, numero_dipartimento)
VALUES('ProdottoX', 1, 'Bellaire', 5);
insert into progetto (nome_progetto, numero_progetto, sede_progetto, numero_dipartimento)
VALUES('ProdottoY', 2, 'Sugarland', 5);
insert into progetto (nome_progetto, numero_progetto, sede_progetto, numero_dipartimento)
VALUES('ProdottoZ', 3, 'Houston', 5);
insert into progetto (nome_progetto, numero_progetto, sede_progetto, numero_dipartimento)
VALUES('ProdottoA', 10, 'Stafford', 4);
insert into progetto (nome_progetto, numero_progetto, sede_progetto, numero_dipartimento)
VALUES('ProdottoC', 20, 'Houston', 1);
insert into progetto (nome_progetto, numero_progetto, sede_progetto, numero_dipartimento)
VALUES('ProdottoB', 30, 'Stafford', 4);

insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('123456789', 1, 32.5);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('123456789', 2, 7.5);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('666884444', 3, 40.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('453453453', 1, 20.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('453453453', 2, 20.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('333445555', 2, 10.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('333445555', 3, 10.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('333445555', 10, 10.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('333445555', 20, 10.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('999887777', 30, 30.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('999887777', 10, 10.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('987987987', 10, 35.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('987987987', 30, 5.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('987654321', 30, 20.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('987654321', 20, 15.0);
insert into lavora_su (ssn_i, n_progetto, ore)
VALUES ('888665555', 20, 25.0);
commit;