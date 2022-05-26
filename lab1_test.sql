insert into direction (sideoftheworld)
values ('north'), ('northeast'), ('east'), ('southeast'), ('south'), ('southwest'), ('west'), ('northwest');

insert into light (brightness, level)
values (2, 5), (3, 10), (1, 0), (420, 6);

insert into speed (speed)
values (200), (0);

insert into dirspeed (directionid, speedid)
values (1, 1), (2, 2);

insert into color (red, green, blue)
values (200, 200, 100), (128, 256, 200);

insert into lightcolor (lightid, colorid)
values (1, 1), (2, 2);

insert into locations (name, part)
values ('Кратер', 'Гребень'), ('Озеро', 'Побережье');

insert into objects (name, shape, size, colorid, speedid, locationid)
VALUES ('Солнце', 'Шар', 255255, 1, 1, 1), ('Монолит', 'Куб', 100, 2, 2, 2);