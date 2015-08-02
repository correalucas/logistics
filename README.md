Instalação
----------

Com o terminal aberto, acesse a pasta do projeto e utilize o comando:

    bundle

para instalar as dependencias.
O comando:

    rake db:create

para criar o banco de dados.
E com o banco de dados criado, utilize o comando:

    rake db:migrate

para executar as migrates de criação de tabelas e população da tabela que contém a malha logística.


Como Funciona
-------------

Ao acessar o endereço ([http://localhost:3000/](http://localhost:3000/)) você visualizará o histórico de consultas já realizadas, bem como acessar os dados da malha logística, podendo alterar, excluír ou adicionar uma rota.

Para realizar uma consulta utilizando o webservice utilize o comando:

    rails c

E assim é possível executar o webservice através dos comandos:
```ruby
# Para instanciar o cliente do webservice, utilize o comando abaixo:
client = Savon.client(wsdl: 'http://localhost:3000/best_way/wsdl')

# Com o webservice instanciado é possível realizar a consulta através do codigo:
# Sendo map: o nome do mapa, origin: o ponto de partida, destination: o destino, 
# autonomy: a autonomia do caminhão e gas: o preço da gasolina
response = client.call(:trace_route, message: { map: 'MAPA', origin: 'ORIGEM', destination: 'DESTINO', autonomy: '9.99', gas: '9.99' })

# Exemplo de retorno:
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:tns=\"levaetraz.com.br\">
  <soap:Body>
    <tns:trace_route_response>
      <value xsi:type=\"xsd:string\">Best route: A, B, and D with cost: 6.25</value>
    </tns:trace_route_response>
  </soap:Body>
</soap:Envelope>
```

Motivação
---------

É saber que sempre haverá uma maneira mais simples de resolver os problemas do dia-a-dia e que eu ainda posso crescer pessoalmente e profissionalmente.
Todo novo desafio que exija de mim busca de conhecimento me motiva a procurar sempre a melhor resposta e a solução mais adequada.