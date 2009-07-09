var BulletinAdminHandler = Class.create({
	initialize: function() {
		this.opfUrlChangeListener = this.opfUrlChange.bindAsEventListener(this);
		$('afterLastOpfPlaceholder').previous().select('input').invoke('observe', 'change', this.opfUrlChangeListener);

		this.bulletinFormSubmitListener = this.validateForm.bindAsEventListener(this);
		$$('form').first().observe('submit', this.bulletinFormSubmitListener);
	},

	opfUrlChange: function (event) {
		var opfContainer = $('afterLastOpfPlaceholder').previous();
		var opf =  opfContainer.select('input');
		if(opf[0].value.length > 0 && opf[1].value.length > 0) {
			opf.invoke('stopObserving', 'change');

			var opfContainerClone = opfContainer.cloneNode(true);
			var newOpf = opfContainerClone.select('input');
			newOpf.first().id = '';
			var id = newOpf.first().identify();
			opfContainerClone.select('label').first().setAttribute('for', id);
			newOpf.last().id = '';
			id = newOpf.last().identify();
			opfContainerClone.select('label').last().setAttribute('for', id);
			newOpf.each(function(e){e.value='';});

			$('afterLastOpfPlaceholder').insert({before: opfContainerClone});
			$('afterLastOpfPlaceholder').previous().select('input').invoke('observe', 'change', this.opfUrlChange);
		}
	},

	validateForm: function (event) {
		var opfs = $$('.opf');
		var errors = [];
		for(var i = 0; i < opfs.length; i++) {
			var opf = opfs[i].select('input');
			if( (opf[0].value.length == 0 || opf[1].value.length == 0) && opf[1].value.length != opf[0].value.length ) {
				errors[errors.length] = "Varje opf länk måste ha både titel och URL";//TODO add which opf caused the error
			}
		}
		if(errors.length > 0) {
			alert(errors);
			event.stop();
		}
	}
});

