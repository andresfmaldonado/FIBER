$.CircleEventManager 			= function( options, element ) {
	
	this.$el			= $( element );
	
	this._init( options );
	
};

$.CircleEventManager.defaults 	= {
	onMouseEnter	: function() { return false },
	onMouseLeave	: function() { return false },
	onClick			: function() { return false }
};

$.CircleEventManager.prototype 	= {
	_init 				: function( options ) {
		
		this.options 		= $.extend( true, {}, $.CircleEventManager.defaults, options );
		
		// set the default cursor on the element
		this.$el.css( 'cursor', 'default' );
		
		this._initEvents();
		
	},
	_initEvents			: function() {
		
		var _self	= this;
		
		this.$el.on({
			'mouseenter.circlemouse'	: function( event ) {
				
				var el	= $(event.target),
				
						  circleWidth	= el.outerWidth( true ),
						  circleHeight	= el.outerHeight( true ),
						  circleLeft	= el.offset().left,
						  circleTop		= el.offset().top,
						  circlePos		= {
							  x		: circleLeft + circleWidth / 2,
							  y		: circleTop + circleHeight / 2,
							  radius: circleWidth / 2
						  };
				
				// save cursor type
				var cursor	= 'default';
				
				if( _self.$el.css('cursor') === 'pointer' || _self.$el.is('a') )
					cursor = 'pointer';
					
				el.data( 'cursor', cursor );
				
				el.on( 'mousemove.circlemouse', function( event ) {

					var distance	= Math.sqrt( Math.pow( event.pageX - circlePos.x, 2 ) + Math.pow( event.pageY - circlePos.y, 2 ) );
					
					if( !Modernizr.borderradius ) {
						
						// inside element / circle
						el.css( 'cursor', el.data('cursor') ).data( 'inside', true );
						_self.options.onMouseEnter( _self.$el );
					
					}
					else {
					
						if( distance <= circlePos.radius && !el.data('inside') ) {
							
							// inside element / circle
							el.css( 'cursor', el.data('cursor') ).data( 'inside', true );
							_self.options.onMouseEnter( _self.$el );
							
						}
						else if( distance > circlePos.radius && el.data('inside') ) {
							
							// inside element / outside circle
							el.css( 'cursor', 'default' ).data( 'inside', false );
							_self.options.onMouseLeave( _self.$el );
						
						}
					
					}
				
				});	
				
			},
			'mouseleave.circlemouse'	: function( event ) {
				
				var el 	= $(event.target);
	
				el.off('mousemove');
				
				if( el.data( 'inside' ) ) {
				
					el.data( 'inside', false );
					_self.options.onMouseLeave( _self.$el );
				
				}
				
			},
			'click.circlemouse'			: function( event ) {
				
				// allow the click only when inside the circle
				
				var el 	= $(event.target);
				
				if( !el.data( 'inside' ) )
					return false;
				else
					_self.options.onClick( _self.$el );
				
			}
		});
		
	},
	destroy				: function() {
	
		this.$el.unbind('.circlemouse').removeData('inside').removeData('cursor');

	}
};
