/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validacion()
{
    // Hay muchas formas de elegir un nodo DOM; aquí obtenemos el formulario y, a continuación, el campo de entrada
    // del correo electrónico, así como el elemento span en el que colocaremos el mensaje de error.
    const form = document.getElementsByTagName('form')[0];

    const email = document.getElementById('email');
    const emailError = document.querySelector('#email + span.error');

    const dni = document.getElementById('dni');
    const dniError = document.querySelector('#dni + span.error');

    const nombre = document.getElementById('nombre');
    const nombreError = document.querySelector('#nombre + span.error');



    const apellidos = document.getElementById('apellidos');
    const apellidosError = document.querySelector('#apellidos + span.error');



    const password = document.getElementById('password');
    const passwordError = document.querySelector('#password + span.error');


    const edad = document.getElementById('edad');
    const edadError = document.querySelector('#edad + span.error');
    
    captcha();

    form.addEventListener('submit', function (event) {
        // si el campo de correo electrónico es válido, dejamos que el formulario se envíe

        if (!email.validity.valid) {
            // Si no es así, mostramos un mensaje de error apropiado
            errorEmail();
            // Luego evitamos que se envíe el formulario cancelando el evento
            event.preventDefault();
        }

        if (!dni.validity.valid) {
            // Si no es así, mostramos un mensaje de error apropiado
            errorDni();
            // Luego evitamos que se envíe el formulario cancelando el evento
            event.preventDefault();
        }

        if (!nombre.validity.valid) {
            // Si no es así, mostramos un mensaje de error apropiado
            errorNombre();
            // Luego evitamos que se envíe el formulario cancelando el evento
            event.preventDefault();
        }



        if (!apellidos.validity.valid) {
            // Si no es así, mostramos un mensaje de error apropiado
            errorApellidos();
            // Luego evitamos que se envíe el formulario cancelando el evento
            event.preventDefault();
        }



        if (!password.validity.valid) {
            // Si no es así, mostramos un mensaje de error apropiado
            errorPass();
            // Luego evitamos que se envíe el formulario cancelando el evento
            event.preventDefault();
        }

        if (!edad.validity.valid) {
            // Si no es así, mostramos un mensaje de error apropiado
            errorEdad();
            // Luego evitamos que se envíe el formulario cancelando el evento
            event.preventDefault();
        }




    });

    email.addEventListener('blur', function (event) {
        // Cada vez que el usuario escribe algo, verificamos si
        // los campos del formulario son válidos.

        if (email.validity.valid) {
            // En caso de que haya un mensaje de error visible, si el campo
            // es válido, eliminamos el mensaje de error.
            emailError.innerHTML = ''; // Restablece el contenido del mensaje
            emailError.className = 'error'; // Restablece el estado visual del mensaje
        } else {
            // Si todavía hay un error, muestra el error exacto
            errorEmail();
        }
    });


    function errorEmail() {
        if (email.validity.valueMissing) {
            // Si el campo está vacío
            // muestra el mensaje de error siguiente.
            emailError.textContent = 'Debe introducir una dirección de correo electrónico.';
        } else if (email.validity.patternMismatch) {
            // Si el campo no contiene una dirección de correo electrónico
            // muestra el mensaje de error siguiente.
            emailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
        }


        // Establece el estilo apropiado
        emailError.className = 'error active';
    }




    dni.addEventListener('blur', function (event) {
        // Cada vez que el usuario escribe algo, verificamos si
        // los campos del formulario son válidos.

        if (dni.validity.valid) {
            // En caso de que haya un mensaje de error visible, si el campo
            // es válido, eliminamos el mensaje de error.
            dniError.innerHTML = ''; // Restablece el contenido del mensaje
            dniError.className = 'error'; // Restablece el estado visual del mensaje
        } else {
            // Si todavía hay un error, muestra el error exacto
            errorDni();
        }
    });


    function errorDni() {
        if (dni.validity.valueMissing) {
            // Si el campo está vacío
            // muestra el mensaje de error siguiente.
            dniError.textContent = 'Debe introducir un Dni.';
        } else if (dni.validity.patternMismatch) {
            // Si el campo no contiene una dirección de correo electrónico
            // muestra el mensaje de error siguiente.
            dniError.textContent = 'El dni tiene que cumplir este patron 00.000.000-X';
        }


        // Establece el estilo apropiado
        dniError.className = 'error active';
    }


    nombre.addEventListener('blur', function (event) {
        // Cada vez que el usuario escribe algo, verificamos si
        // los campos del formulario son válidos.

        if (nombre.validity.valid) {
            // En caso de que haya un mensaje de error visible, si el campo
            // es válido, eliminamos el mensaje de error.
            nombreError.innerHTML = ''; // Restablece el contenido del mensaje
            nombreError.className = 'error'; // Restablece el estado visual del mensaje
        } else {
            // Si todavía hay un error, muestra el error exacto
            errorNombre();
        }
    });


    function errorNombre() {
        if (nombre.validity.valueMissing) {
            // Si el campo está vacío
            // muestra el mensaje de error siguiente.
            nombreError.textContent = 'Debe introducir un Nombre.';
        } else if (nombre.validity.patternMismatch) {
            // Si el campo no contiene una dirección de correo electrónico
            // muestra el mensaje de error siguiente.
            nombreError.textContent = 'Tiene que haber un nombre';
        }


        // Establece el estilo apropiado
        nombreError.className = 'error active';
    }







    apellidos.addEventListener('blur', function (event) {
        // Cada vez que el usuario escribe algo, verificamos si
        // los campos del formulario son válidos.

        if (apellidos.validity.valid) {
            // En caso de que haya un mensaje de error visible, si el campo
            // es válido, eliminamos el mensaje de error.
            apellidosError.innerHTML = ''; // Restablece el contenido del mensaje
            apellidosError.className = 'error'; // Restablece el estado visual del mensaje
        } else {
            // Si todavía hay un error, muestra el error exacto
            errorApellidos();
        }
    });


    function errorApellidos() {
        if (apellidos.validity.valueMissing) {
            // Si el campo está vacío
            // muestra el mensaje de error siguiente.
            apellidosError.textContent = 'Debe introducir los Apellidos.';
        } else if (apellidos.validity.patternMismatch) {
            // Si el campo no contiene una dirección de correo electrónico
            // muestra el mensaje de error siguiente.
            apellidosError.textContent = 'Tiene que haber Apellidos';
        }


        // Establece el estilo apropiado
        apellidosError.className = 'error active';
    }










    password.addEventListener('blur', function (event) {
        // Cada vez que el usuario escribe algo, verificamos si
        // los campos del formulario son válidos.

        if (password.validity.valid) {
            // En caso de que haya un mensaje de error visible, si el campo
            // es válido, eliminamos el mensaje de error.
            passwordError.innerHTML = ''; // Restablece el contenido del mensaje
            passwordError.className = 'error'; // Restablece el estado visual del mensaje
        } else {
            // Si todavía hay un error, muestra el error exacto
            errorPass();
        }
    });


    function errorPass() {
        if (password.validity.valueMissing) {
            // Si el campo está vacío
            // muestra el mensaje de error siguiente.
            passwordError.textContent = 'Debe introducir una Contraseña.';
        } else if (password.validity.tooShort) {
            // Si los datos son demasiado cortos
            // muestra el mensaje de error siguiente.
            passwordError.textContent = 'La contraseña debe tener al menos ' + password.minLength + ' caracteres y como máximo ' + password.maxLength;
        }


        // Establece el estilo apropiado
        passwordError.className = 'error active';
    }


    edad.addEventListener('blur', function (event) {
        // Cada vez que el usuario escribe algo, verificamos si
        // los campos del formulario son válidos.

        if (edad.validity.valid) {
            // En caso de que haya un mensaje de error visible, si el campo
            // es válido, eliminamos el mensaje de error.
            edadError.innerHTML = ''; // Restablece el contenido del mensaje
            edadError.className = 'error'; // Restablece el estado visual del mensaje
        } else {
            // Si todavía hay un error, muestra el error exacto
            errorEdad();
        }
    });


    function errorEdad() {
        if (edad.validity.valueMissing) {
            // Si el campo está vacío
            // muestra el mensaje de error siguiente.
            passwordError.textContent = 'Debe introducir una Contraseña.';
        } else if (edad.validity.tooShort) {
            // Si los datos son demasiado cortos
            // muestra el mensaje de error siguiente.
            edadError.textContent = 'La contraseña debe tener al menos ' + edad.minLength + ' caracteres y como máximo ' + edad.maxlength;
        }


        // Establece el estilo apropiado
        edadError.className = 'error active';
    }

    

}

var code = '';
var resultado=0;
    function captcha() {
         var operador;
       var n=Math.round(Math.random()*10);
       var n2=Math.round(Math.random()*10);
       var ale=Math.round(Math.random()*3+1);
       
       if(ale==1){
           operador="+";
           resultado=n+n2;
       }
      
     
       else if(ale==2){
           operador="-";
           resultado=n-n2;
       }
       else{
           operador="*";
           resultado=n*n2;
       }
      
        code = n + ' ' + operador + ' ' + n2;
       
        creaIMG(code);
    }

    function validCaptcha(txtInput) {
        var string1 = resultado;
        var string2 = document.getElementById(txtInput).value;
        console.log(string1);
        console.log(string2);

        if (string1 == string2) {
            return true;
        } else {
            captcha();
            return false;
        }
    }
    function removeSpaces(string) {
        return string.split(' ').join('');
    }

    function creaIMG(texto) {
        var ctxCanvas = document.getElementById('captcha').getContext('2d');
        var fontSize = "30px";
        var fontFamily = "Arial";
        var width = 250;
        var height = 50;
        //tamaño
        ctxCanvas.canvas.width = width;
        ctxCanvas.canvas.height = height;
        //color de fondo
        ctxCanvas.fillStyle = "whitesmoke";
        ctxCanvas.fillRect(0, 0, width, height);
        //puntos de distorsión
        ctxCanvas.setLineDash([7, 10]);
        ctxCanvas.lineDashOffset = 5;
        ctxCanvas.beginPath();
        var line;
        for (var i = 0; i < (width); i++) {
            line = i * 5;
            ctxCanvas.moveTo(line, 0);
            ctxCanvas.lineTo(0, line);
        }
        ctxCanvas.stroke();
        //formato texto
        ctxCanvas.direction = 'ltr';
        ctxCanvas.font = fontSize + " " + fontFamily;
        //texto posicion
        var x = (width / 9);
        var y = (height / 3) * 2;
        //color del borde del texto
        ctxCanvas.strokeStyle = "yellow";
        ctxCanvas.strokeText(texto, x, y);
        //color del texto
        ctxCanvas.fillStyle = "red";
        ctxCanvas.fillText(texto, x, y);
    }