final criarTabela = '''

CREATE TABLE contato(
  id INTEGER NOT NULL PRIMARY KEY,
  nome VARCHAR(250) NOT NULL,
  telefone CHAR(16) NOT NULL,
  email VARCHAR(150) NOT NULL,
  url_avatar VARCHAR(300) NOT NULL
)

''';

final inserirContato1 = '''
INSERT INTO contato('nome','telefone','email','url_avatar') 
VALUES('Glauco','(63)992646390','glaucobatista@outlook.com','https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png')
''';

final inserirContato2 = '''
INSERT INTO contato('nome','telefone','email','url_avatar') 
VALUES('Iza','(63)992912858','iza@iza.com','https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807_960_720.png')
''';

final inserirContato3 = '''
INSERT INTO contato('nome','telefone','email','url_avatar') 
VALUES('Gleison','(63)992345678','gleison@gleison.com','https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png')
''';
