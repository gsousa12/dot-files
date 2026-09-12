Aqui está um arquivo .md simples e rápido que ensina a remover e configurar o user e email globalmente no Git:

text

`# Configurando Usuário e Email Globais no Git Este guia rápido mostra como remover e definir o nome de usuário e email globais no Git via terminal.  ## Remover usuário e email globais  Para remover o usuário global configurado no Git:`

git config --global --unset user.name

text

`Para remover o email global configurado no Git:`

git config --global --unset user.email

text

`## Configurar usuário e email globais  Para definir um novo nome de usuário global no Git:`

git config --global user.name "Seu Nome"

text

`Para definir um novo email global no Git:`

git config --global user.email "[seu.email@exemplo.com](mailto:seu.email@exemplo.com)"

text

`## Verificar configuração atual  Para verificar as configurações globais atuais de usuário e email:`

git config --global user.name  
git config --global user.email

text

`---  Estas configurações serão aplicadas a todos os repositórios Git no seu sistema, a menos que você possa sobrescrevê-las localmente por repositório.`

Se desejar, posso enviar este arquivo em formato de texto para download.

1. [https://stackoverflow.com/questions/37805621/change-email-address-in-git](https://stackoverflow.com/questions/37805621/change-email-address-in-git)
2. [https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Configura%C3%A7%C3%A3o-Inicial-do-Git](https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Configura%C3%A7%C3%A3o-Inicial-do-Git)
3. [https://docs.github.com/en/get-started/git-basics/setting-your-username-in-git](https://docs.github.com/en/get-started/git-basics/setting-your-username-in-git)
4. [https://git-scm.com/book/ms/v2/Getting-Started-First-Time-Git-Setup](https://git-scm.com/book/ms/v2/Getting-Started-First-Time-Git-Setup)
5. [https://linuxize.com/post/how-to-configure-git-username-and-email/](https://linuxize.com/post/how-to-configure-git-username-and-email/)
6. [https://www.codewalnut.com/tutorials/how-to-configure-git-user-name-and-user-email](https://www.codewalnut.com/tutorials/how-to-configure-git-user-name-and-user-email)
7. [https://www.youtube.com/watch?v=yDntCIs-IJM](https://www.youtube.com/watch?v=yDntCIs-IJM)
8. [https://labex.io/pt/tutorials/git-how-to-set-up-git-user-name-and-email-globally-414957](https://labex.io/pt/tutorials/git-how-to-set-up-git-user-name-and-email-globally-414957)
9. [https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config)
10. [https://docs.github.com/pt/account-and-profile/how-tos/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address](https://docs.github.com/pt/account-and-profile/how-tos/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address)