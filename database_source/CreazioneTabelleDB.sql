use eatreorder;

create table UtenteRegistrato(
email varchar(100) primary key,
pass varchar(20) not null,
tipologia varchar(10) not null,
is_banned boolean not null
);

create table Cliente(
nome varchar(40) not null,
cognome varchar(40) not null,
email varchar(100), foreign key (email) references UtenteRegistrato(email)
on update cascade 
on delete cascade,
primary key(email, nome)
);

create table Azienda(
nome varchar(40) not null,
via varchar(80) not null,
numero_civico decimal(3) not null,
citta varchar(45) not null,
provincia character(2) not null,
partita_iva character(11) not null,
telefono varchar(10) not null,
orario_apertura time not null,
orario_chiusura time not null,
email varchar(100), foreign key (email) references UtenteRegistrato(email) 
on update cascade 
on delete cascade,
primary key(email, nome)
);

create table Fattorino(
nome varchar(40) not null, 
cognome varchar(40) not null,
telefono varchar(10) not null,
citta_consegna varchar(80) not null,
provincia character(2) not null,
orario_inizio time not null,
orario_fine time not null,
email varchar(100), foreign key (email) references UtenteRegistrato(email) 
on update cascade 
on delete cascade,
primary key(email,nome)
);

create table Prodotto( 
codice int AUTO_INCREMENT,
nome varchar(45) not null,
descrizione varchar(250) not null,
prezzo decimal(10,2) not null,
path_immagine varchar(250) not null,
azienda varchar(40),
email varchar(100), 
foreign key (email,azienda) references Azienda(email,nome)
on update cascade 
on delete cascade,
primary key(codice)
);

create table Ordine(
codice int AUTO_INCREMENT,
indirizzo_consegna varchar(255) not null,
numero_carta character(16) not null,
prezzo_totale decimal(10,2) not null,
telefono_cliente varchar(10) not null,
note varchar(150),
stato varchar(20) not null,
acquirente varchar(40), 
email_acquirente varchar(100), 
foreign key (email_acquirente, acquirente) references Cliente(email, nome)
on update cascade 
on delete cascade,
azienda varchar(40),
email_azienda varchar(100), 
foreign key (email_azienda, azienda) references Azienda(email, nome)
on update cascade 
on delete set null,
fattorino varchar(40), 
email_fattorino varchar(100),
foreign key (email_fattorino, fattorino) references Fattorino(email, nome)
on update cascade 
on delete cascade,
primary key(codice)
);

create table GiorniLavorativi(
giorno varchar(10) not null,
email varchar(100), foreign key (email) references UtenteRegistrato(email)
on update cascade 
on delete cascade,
primary key(email,giorno)
);

create table Moderatore(
id int not null,
email varchar(100), foreign key (email) references UtenteRegistrato(email)
on update cascade 
on delete cascade,
primary key(email,id)
);

create table ProdottoQuantita(
quantita decimal(2) not null,
prodotto int, foreign key (prodotto) references Prodotto(codice)
on update cascade 
on delete cascade,
ordine int, foreign key (ordine) references Ordine(codice)
on update cascade 
on delete cascade,
primary key(prodotto,ordine)
);

