# Utilizando o Terraform para gerenciar uma infra da AWS. 

1. criar um arquivo terraform e chama-lo de "main.tf"

2. Com o arquivo criado, deve-se especificar qual (os quais) **provider** que será utilizado.

3. Declarar quais resources da amazon serão utilizados. 
 - O **aws_instance**  declara o sistema operacional, a configuração e a quantidade de maquinas que serão utilizados.

 - O **aws_security_group** declara como será feito o acesso as maquinas criadas atraves do aws_instance. No meu caso, por exemplo, estou utilizando uma conexão SSH, instanciando uma lista de IPS que irão ter acesso as maquinas criadas.

### Chave SSH
Para gerenciar os **Resources** em nuvem, utiliza-se de uma chave SSH. Para cada região da AWS é necessario criar uma chave, mas já que a gestão está sendo feita via Terraform, então é possivel **gerar uma chave local e distribui-la pelas regiões da AWS de acordo com a necessidade.**
* Gerando a chave SSH:

## Comandos do Terraform
- **terraform init** - Inicia a configuração do terraform no diretorio após a especificação do provider no arquivo main.tf.
- **terraform plan** - Mostra de execução do que será realizado. Logo mostra tudo o que será, criado, alterado ou removido.
- **terraform apply** - As alterações feitas serão aplicadas. Como uma boa pratica deve ser executado após o plan.
- **terraform show**