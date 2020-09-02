var gender = null;

function make_female() {
    gender = true

    document.getElementById( "female" ).classList.add( "active" )
    document.getElementById( "male" ).classList.remove( "active" )
}

function make_male() {
    gender = false

    document.getElementById( "male" ).classList.add( "active" )
    document.getElementById( "female" ).classList.remove( "active" )
}

function validate() {
    const name = document.getElementById( "name" ).value
    const surname = document.getElementById( "surname" ).value

    var valid = true

    if( !name ) {
        document.getElementById( "name" ).classList.add( "invalid" )

        valid = false
    } else {
        document.getElementById( "name" ).classList.remove( "invalid" )
    }

    if( !surname ) {
        document.getElementById( "surname" ).classList.add( "invalid" )

        valid = false
    } else {
        document.getElementById( "surname" ).classList.remove( "invalid" )
    }

    if( gender == null ) {
        document.getElementById( "gender" ).classList.add( "invalid" )

        valid = false
    } else {
        document.getElementById( "gender" ).classList.remove( "invalid" )
    }

    if( !valid ) {
        document.getElementById( "err" ).innerHTML = "Please provide the missing informations"

        return
    } else {
        document.getElementById( "err" ).innerHTML = ""
    }

    //  Save the player's information
    console.log( name + " " + surname  )

    // Remove the frame
    document.getElementById( "main" ).style.opacity = '0';
    
    setTimeout( function() {
        Events.Call( "Validated", name, surname, gender );
    }, 300 )
}