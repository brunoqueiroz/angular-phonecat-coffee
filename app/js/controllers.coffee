# App Controllers
@PhoneCatCtrl = ($route) ->
  self = this

  $route.when '/phones',
    {template: 'partials/phone-list.html',   controller: PhoneListCtrl}
  $route.when '/phones/:phoneId',
    {template: 'partials/phone-detail.html', controller: PhoneDetailCtrl}
  $route.otherwise {redirectTo: '/phones'}
  $route.onChange () ->
    self.params = $route.current.params
  $route.parent(this)

@PhoneListCtrl = (Phone_) ->
  this.orderProp = 'age'
  this.phones = Phone_.query()

@PhoneDetailCtrl = (Phone_) ->
  self = this

  self.phone = Phone_.get {phoneId: self.params.phoneId}, (phone) ->
    self.mainImageUrl = phone.images[0]

  self.setImage = (imageUrl) ->
    self.mainImageUrl = imageUrl
