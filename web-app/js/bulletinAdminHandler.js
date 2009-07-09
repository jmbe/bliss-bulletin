var BulletinAdminHandler = Class.create({
	initialize: function() {
		this.opfUrlChangeListener = this.opfUrlChange.bindAsEventListener(this);
		$('afterLastOpfPlaceholder').previous().select('input').invoke('observe', 'change', this.opfUrlChangeListener);
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
			newOpf.each(function(e){e.value='';});

			$('afterLastOpfPlaceholder').insert({before: opfContainerClone});
			$('afterLastOpfPlaceholder').previous().select('input').invoke('observe', 'change', this.opfUrlChange);
		}
	}

});

