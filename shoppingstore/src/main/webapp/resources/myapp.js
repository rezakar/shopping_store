$(document).ready(function(){
	
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
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	case 'Service':
		$('#service').addClass('active');
		break;
	default:
		if(menu == "Shopping Store") break;
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
	break;
	}
	//code for jquery datatable
	//Create a dataset
	
	var $table = $('#productListTable');
	
	//execute the below code only where have this table
	if ($table.length){
		var jsonUrl = '';
		if(window.categoryid == ''){
			jsonUrl = window.contextRoot + '/jason/data/all/products';
		}else{
			jsonUrl = window.contextRoot + '/jason/data/category/'+ window.categoryid +'products';
		}
		$table.DataTable({
			lengthMenu:[[3,5,10,-1],['3 Records','5 Records','10 Records','All']],
			pageLength:5,
			ajax: {
				url :jsonUrl,
				dataSrc: ''
			},
			columns: [
				
				{
					data:'code'
					/*mRender: function(data, type, row){
						return '<img src="'+window.contextRoot+'/resources/'+data+'.jpg"/>';
					}*/
				},
				{
					data:'name'
				},
				{
					data:'brand'
				},
				{
					data:'unit_price',
						mRender: function(data, type, row){
							return '&#36;' + data
						}
				},
				{
					data:'quantity',
					mRender: function(data, type, row){
						if (data < 1){
							return '<span style="color:red">Out of stock!</span>';
						}
							
						return data;
					}
				},
				{
					data:'is_active'
				},
				{
					data: 'productsid',
					bSortable: false,
						mRender: function(data, type, row){
						var str = '';
				str+= '<a href="'+window.contextRoot+'/shows/'+data+'/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></a> &#160;';
				if(row.quantity < 1) {
					str+= '<a href="javascript:void(0)" class="btn btn-success disable"><span class="glyphicon glyphicon-shopping-cart"></span></a>';

				}else{
					str+= '<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';

				}
				
				return str;
				}
				}
			]
		});
	}
	//dismissing the alert after 3 seconds
	var $alert= $('.alert');
	if($alert.length){
		setTimeout(function(){
		$alert.fadeOut('slow');
	} , 3000)
	}
	
	
});
