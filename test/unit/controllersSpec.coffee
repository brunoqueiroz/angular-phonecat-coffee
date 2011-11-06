# jasmine specs for controllers go here
describe 'PhoneCat controllers', () ->
  beforeEach () ->
    this.addMatchers { toEqualData: (expected) ->
      angular.equals(this.actual, expected) }

  describe 'PhoneListCtrl', () ->
    $browser = {}
    ctrl = {}
    scope = {}
    beforeEach () ->
      scope = angular.scope()
      $browser = scope.$service '$browser'
      $browser.xhr.expectGET('phones/phones.json').respond([{name: 'Nexus S'}, {name: 'Motorola DROID'}])
      ctrl = scope.$new(PhoneListCtrl)

    it 'should create "phones" model with 2 phones fetched from xhr', () ->
      expect(ctrl.phones).toEqual([])
      $browser.xhr.flush()
      expect(ctrl.phones).toEqualData([{name: 'Nexus S'}, {name: 'Motorola DROID'}])

    it 'should set the default value of orderProp model', () ->
      expect(ctrl.orderProp).toBe('age')

  describe 'PhoneDetailCtrl', () ->
    $browser = {}
    scope = {}
    beforeEach () ->
      scope = angular.scope()
      $browser = scope.$service('$browser')

    it 'should fetch phone detail', () ->
      scope.params = {phoneId:'xyz'}
      $browser.xhr.expectGET('phones/xyz.json').respond({name:'phone xyz'})
      ctrl = scope.$new(PhoneDetailCtrl)

      expect(ctrl.phone).toEqualData({})
      $browser.xhr.flush()

      expect(ctrl.phone).toEqualData({name:'phone xyz'})
