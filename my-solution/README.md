# Solução para o problema descrito abaixo

## Tarefa

Suponha que você esteja executando em sua nuvem favorita (Azure, AWS, GCP)
Crie um README.md que descreva sua linha de pensamento para a solução
Crie recursos de terraform, docker e kubernetes
Assuma escalonamento diário da curva em sino. Alto tráfego durante o dia e baixo tráfego durante o
Queremos implantar dois contêineres que se dimensionam independentemente um do outro
Container 1: Este contêiner executa uma pequena API que retorna dados do S3
Container 2: Este contêiner executa uma pequena API que retorna informações do consultor de um banco de dados
Esteja ciente de que você pode usar qualquer imagem docker que desejar para seus contêineres. É apenas um exemplo. O que realmente buscamos aqui é como você considerará em todos os manifestos perguntados acima.
Para a melhor experiência do usuário, escala automática Container 1quando a média da CPU atinge 70%
Para a melhor experiência do usuário, escala automática Container 2quando a média de memória atinge 70%
Certifique-se de que a implantação pode lidar com implantações e reversões
Como você aplicaria as configurações a vários ambientes (por exemplo, teste x produção)?


## Critério de avaliação

1. Os problemas são resolvidos de forma eficiente e eficaz, o aplicativo funciona conforme o esperado.
2. O aplicativo é fornecido com os scripts de configuração.
3. O aplicativo está bem organizado e logicamente.
4. A submissão é acompanhada de documentação com a fundamentação das decisões tomadas.
5. O código está documentado e é fácil de seguir.
6. As respostas que você fornece durante a revisão do código.
7. Uma descrição informativa e detalhada no PR.
8. Seguindo o guia de estilo padrão da indústria.
9. Um histórico do git (mesmo que breve) com mensagens de commit claras e concisas.


Primeiro criar um cluster kubernetes com terraform e ansible

Segundo criar os dockers para os 2 containeres e para o jenkins

Terceiro realizar os deploys e ajustar os hpa para escalonamento automático.


## application 

https://docs.aws.amazon.com/code-samples/latest/catalog/python-s3-s3_basics-bucket_wrapper.py.html