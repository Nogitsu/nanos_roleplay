const body = document.getElementsByTagName( "body" )[0]

body.addEventListener( "mousemove", function( event ) {
    body.style.backgroundPositionX = - event.offsetX / 100 + "px"
    body.style.backgroundPositionY = - event.offsetY / 100 + "px"
} )

function login() {
    const main = document.getElementById( "login" )

    while ( main.children.length > 1 ) {
        const element = main.children[1]

        element.remove()
    }

    body.getElementsByTagName( "p" )[0].style.transition = "opacity 0.5s"
    body.getElementsByTagName( "p" )[0].style.opacity = 0

    main.children[0].classList.add( "logo_loading" )

    //body.appendChild( main.children[0] )
    //main.remove()
}