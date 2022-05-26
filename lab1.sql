drop table if exists direction, color, light, locations, objects, speed, dirspeed, lightcolor cascade;

CREATE TABLE light (

    id serial NOT NULL,

    brightness int NOT NULL CHECK ( brightness > 0 ),

    level int NOT NULL CHECK ( level >= 0 ),

    PRIMARY KEY (id)

);

CREATE TABLE color (

    id serial NOT NULL,

    red int CHECK ( red >= 0 and red <= 256 ),

    green int CHECK ( green >= 0 and green <= 256 ),

    blue int CHECK ( blue >= 0 and blue <= 256 ),

    PRIMARY KEY (id)
);

CREATE TABLE lightcolor (

    id serial NOT NULL,

    lightID int not null,

    colorID int not null,

    PRIMARY KEY (id),

    FOREIGN KEY ( lightID ) REFERENCES light ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY ( colorID ) REFERENCES color ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE direction (

    id serial NOT NULL,

    sideoftheworld varchar(30) NOT NULL CHECK (sideoftheworld IN ('north', 'northeast', 'east', 'southeast', 'south', 'southwest', 'west', 'northwest')),

    PRIMARY KEY (id)

);

CREATE TABLE speed (

    id serial NOT NULL,

    speed int NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE dirspeed (

    id serial NOT NULL,

    directionID serial NOT NULL,

    speedID serial NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY ( directionID ) REFERENCES direction ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY ( speedID ) REFERENCES speed ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE locations (

       id serial NOT NULL,

       name varchar(30) NOT NULL,

       part varchar(30) NOT NULL,

       PRIMARY KEY (id)
);

CREATE TABLE objects (

    id serial NOT NULL,

    name varchar(30) UNIQUE,

    shape varchar(30) NOT NULL,

    size int NOT NULL,

    colorID serial,

    speedID serial,

    locationID serial,

    PRIMARY KEY (id),

    FOREIGN KEY ( colorID ) REFERENCES color ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY ( speedID ) REFERENCES speed ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY ( locationID ) REFERENCES locations ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE daytime (

    id serial NOT NULL,

    time varchar(30)  NOT NULL CHECK (time IN ('morning', 'day', 'evening', 'night')),

    PRIMARY KEY (id)
);

CREATE TABLE observer (

    id   serial NOT NULL,

    name varchar(30) UNIQUE,

    visibility int CHECK( visibility >= 0 AND visibility <= 100 ),

    objectID serial,

    FOREIGN KEY ( objectID ) REFERENCES objects ( id )

        ON DELETE CASCADE
        ON UPDATE CASCADE,

    PRIMARY KEY (id)
);