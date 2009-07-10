var BulletinAdminHandler = Class.create({
	initialize: function() {
		this.opfUrlChangeListener = this.opfUrlChange.bindAsEventListener(this);
		$('afterLastOpfPlaceholder').previous().select('input').invoke('observe', 'keyup', this.opfUrlChangeListener);

		this.bulletinFormSubmitListener = this.validateForm.bindAsEventListener(this);
		$$('form').first().observe('submit', this.bulletinFormSubmitListener);
	},

	opfUrlChange: function (event) {
		var opfContainer = $('afterLastOpfPlaceholder').previous();
		var opfInput =  opfContainer.select('input');
		//Only add a new row when both of the last opf input fields have a value
		if(opfInput.first().value.length > 0 && opfInput.last().value.length > 0) {
			opfInput.invoke('stopObserving', 'keyup');

			var opfContainerClone = opfContainer.cloneNode(true);
			var newOpfInput = opfContainerClone.select('input');
			newOpfInput.each(function(e){
				e.value='';
				e.id='';
			});
			var id = newOpfInput.first().identify();
			opfContainerClone.select('label').first().setAttribute('for', id);
			id = newOpfInput.last().identify();
			opfContainerClone.select('label').last().setAttribute('for', id);

			$('afterLastOpfPlaceholder').insert({before: opfContainerClone});
			$('afterLastOpfPlaceholder').previous().select('input').invoke('observe', 'keyup', this.opfUrlChangeListener);
		}
	},

	validateForm: function (event) {
		var opfs = $$('.opf');
		var errors = [];
		for(var i = 0; i < opfs.length; i++) {
			var opf = opfs[i].select('input');
			if( (opf[0].value.length == 0 || opf[1].value.length == 0) && opf[1].value.length != opf[0].value.length ) {
				errors[errors.length] = "Varje OPF-länk måste ha både titel och URL";//TODO add which opf caused the error
			}
		}
		if(errors.length > 0) {
			alert(errors);
			event.stop();
		}
	}
});

