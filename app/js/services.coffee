# http://docs.angularjs.org/#!angular.service

angular.service 'Phone', ($resource) ->
  $resource('phones/:phoneId.json', {}, {
    query: {method:'GET', params:{phoneId:'phones'}, isArray:true}
  })
