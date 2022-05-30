# Utilizando o Terraform para gerenciar uma infra da AWS. 

1. criar um arquivo terraform e chama-lo de "main.tf"

2. Com o arquivo criado, deve-se especificar qual (os quais) **provider** que será utilizado.

3. Declarar quais resources da amazon serão utilizados. 
 - O **aws_instance**  declara o sistema operacional, a configuração e a quantidade de maquinas que serão utilizados.

 - O **aws_security_group** declara como será feito o acesso as maquinas criadas atraves do aws_instance. No meu caso, por exemplo, estou utilizando uma conexão SSH, instanciando uma lista de IPS que irão ter acesso as maquinas criadas.

### Chave SSH
Para gerenciar os **Resources** em nuvem, utiliza-se de uma chave SSH. Para cada região da AWS é necessario criar uma chave, mas já que a gestão está sendo feita via Terraform, então é possivel **gerar uma chave local e distribui-la pelas regiões da AWS de acordo com a necessidade.**
 #### Gerando a chave SSH:
 - no diretorio do projeto **ssh-keygen -f nomeDaChave -t rsa**. 
 Serão gerado um par de chaves, uma publica e a outra privada. Se você usa linux, é interessante mover a chave privada e copiar a chave publica para o diretorio ./ssh/
 **mv nomeDaChave ~/.ssh/**
- Após isso, basta entrar na  região será trabalhada na AWS, clicar em **Import Key Pair**, selecionar o arquivo da chave publica que foi criada no repositorio **nomeDaChave.pub** e realizar o **import**. 
- Assim não será necessario criar uma chave para cada região, basta copiar o arquivo local para cada região que será utilizada pelo projeto.

## Comandos do Terraform
- **terraform init** - Inicia a configuração do terraform no diretorio após a especificação do provider no arquivo main.tf.
- **terraform plan** - Mostra de execução do que será realizado. Logo mostra tudo o que será, criado, alterado ou removido.
- **terraform apply** - As alterações feitas serão aplicadas. Como uma boa pratica deve ser executado após o plan.
- **terraform show**