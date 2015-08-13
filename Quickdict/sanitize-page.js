if(!(document.body.className.indexOf('sanitized') != -1)){
    var d = document.getElementById('maincontent');
    d.setAttribute('style','margin: 0px');
    d.setAttribute('style','padding: 0px');
    document.body.innerHTML = '';
    document.body.appendChild(d);
    var element = document.getElementsByTagName('form');
    for (index = element.length - 1; index >= 0; index--) {
        element[index].parentNode.removeChild(element[index]);
    }
    [].forEach.call(document.querySelectorAll('.noli666'),function(e){
                    e.parentNode.removeChild(e);
                    });
    [].forEach.call(document.querySelectorAll('.orangebar'),function(e){
                    e.parentNode.removeChild(e);
                    });
    [].forEach.call(document.querySelectorAll('.subnav'),function(e){
                    e.parentNode.removeChild(e);
                    });
    document.body.setAttribute("class", "sanitized");
    document.body.setAttribute("max-width", "100%")
    document.body.setAttribute("overflow-x", "hidden")
    document.documentElement.setAttribute("max-width", "100%")
    document.documentElement.setAttribute("overflow-x", "hidden")
    
    console.log("sanitized!")
}