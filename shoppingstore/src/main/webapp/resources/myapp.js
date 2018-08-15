$(function(){
	switch(menu) {
	//active menu navigation bar
	case'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'Products':
		$('#products').addClass('active');
		break;
	case 'Service':
		$('#service').addClass('active');
		break;
	default:
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
	break;
	}
});
