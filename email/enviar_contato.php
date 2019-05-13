<?php

//Checa se os campos estão vazios.
if(empty($_POST['nome'])  		||
   empty($_POST['email']) 		||
   empty($_POST['mensagem'])	||
   !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL))
   {
	echo "Nenhum item foi preenchido.";
    
	return false; //Retorna com a mensagem de falha no envio.
   }
	
$nome = $_POST['nome'];
$email = $_POST['email'];
$mensagem = $_POST['mensagem'];
	
// Create the email and send the message
$para = 'clevinhoirineu222@gmail.com'; //E-mail no qual o formulário enviará as mensagens
$titulo = "Contato do:  $nome"; //Titulo do e-mail
$detalhe = "Você recebeu uma mensagem do formulário de contato do seu website.\n\n"."Confira os detalhes:\n\nNome completo: $nome\nE-mail: $email\nMensagem:\n\n$mensagem"; // Dados completo do FORM preenchido.
$cabecalho = "De: noreply@cleversonirineu.com\n"; //E-mail de cabeçalho (não responde)
$resposta = "Responder para: $email"; //E-mail preenchido no FORM

mail($para,$titulo,$detalhe,$cabecalho,$resposta);

return true; //Retorna com a mensagem de sucesso no envio.

?>