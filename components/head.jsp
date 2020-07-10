<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
    <head>
        <title>WASEREL</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="components/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css">
        <script>
            document.addEventListener('DOMContentLoaded', () => {
    
                const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
                if ($navbarBurgers.length > 0) {
    
                    $navbarBurgers.forEach(el => {
                        el.addEventListener('click', () => {
                            const target = el.dataset.target;
                            const $target = document.getElementById(target);
                            el.classList.toggle('is-active');
                            $target.classList.toggle('is-active');
                        });
                    });
                }
            });
        </script>
    </head>