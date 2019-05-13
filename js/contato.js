$(function() {

    $("input,textarea").jqBootstrapValidation({
        preventSubmit: true,
        submitError: function($form, event, errors) {

        },
        submitSuccess: function($form, event) {
            event.preventDefault();
            
            // Resgata os valores digitados no FORM
            var nome = $("input#nome").val();
            var email = $("input#email").val();
            var mensagem = $("textarea#mensagem").val();

            $.ajax({
                url: "././email/enviar_contato.php",
                type: "POST",
                data: {
                    nome: nome,
                    email: email,
                    mensagem: mensagem
                },
                cache: false,
                success: function() {
                    // Mensagem de sucesso no envio
                    $('#success').html("<div class='alert alert-success'>");
                    $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                        .append("</button>");
                    $('#success > .alert-success')
                        .append("<strong>Prontinho! A sua mensagem foi enviada com sucesso.</strong>");
                    $('#success > .alert-success')
                        .append('</div>');

                    //Apaga todos os itens do FORM automaticamente
                    $('#contactForm').trigger("reset");
                },
                error: function() {
                    // Mensagem de falha no envio
                    $('#success').html("<div class='alert alert-danger'>");
                    $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                        .append("</button>");
                    $('#success > .alert-danger').append("<strong>Desculpe! Nosso servidor de e-mail não está respondendo. Tente novamente mais tarde.");
                    $('#success > .alert-danger').append('</div>');
                    
                    //Apaga todos os itens do FORM automaticamente
                    $('#contactForm').trigger("reset");
                },
            })
        },
        filter: function() {
            return $(this).is(":visible");
        },
    });

    $("a[data-toggle=\"tab\"]").click(function(e) {
        e.preventDefault();
        $(this).tab("show");
    });
});

//Função para fechar as janelas de mensagem de sucesso/falha no envio
$('#nome').focus(function() {
    $('#success').html('');
});
