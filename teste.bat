@ echo off

rem crio uma variavel chamada backup com o caminho do projeto, para facil manutenção do script, (eu o programei em linux/wine).
rem coloque apenas o caminho onde o projeto se encontra, o nome do projeto sera informado logo após
set caminho=%userprofile%\documents\netbeansprojects\


rem crio uma variavel chamada project, para ultilizar com outros projetos.
set project="nome do projeto aqui(com aspas se tiver espaços)"


rem testa se o caminho e o projeto existem, se sim, ele executara uma serie de comandos para fazer o backup e sair, se não, ele extraira o conteudo dentro do arquivo backup.7z onde ele deveria estar.
if exist %caminho%\%project% (goto :backup) else (goto :restore)



rem bloco de comandos responsavel de fazer o backup.
:backup


rem testa se um arquivo "backup.7z.old" existe, se sim ele o deletara (arquivos *.old são arquios destinados a serem apagados pelo sistema, mas se caso algo der errado, esses arquivos são usados, como um backup do backup)
if exist backup\backup.7z.old (del backup\backup.7z.old)


rem testa se um arquivo "backup.7z" existe, se sim ele adicionara o .old na frente
if exist backup\backup.7z (ren backup\backup.7z backup.7z.old)


rem finalmente mando o 7z comprimir o projeto na pasta root do script com o nome de backup
7z\7z a backup\backup %caminho%\%project%


rem :eof é o fim do script, já de padrão na shell do windows
goto :eof


rem bloco de comandos responsavel de fazer a restalração do backup
:restore


rem extrai o conteudo do arquivo "backup.7z" no caminho onde deveria estar.
7z\7z x backup\backup.7z -o%caminho%

goto :eof
