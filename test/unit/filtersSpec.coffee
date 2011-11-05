# jasmine specs for filters go here

describe 'checkmark filter', () ->

  it 'should convert boolean values to unicode checkmark or cross', () ->
    expect(angular.filter.checkmark(true)).toBe('\u2713')
    expect(angular.filter.checkmark(false)).toBe('\u2718')
