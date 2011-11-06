#jasmine-like end2end tests go here

describe 'PhoneCat App', () ->
  describe 'Default routing', () ->
    it 'should redirect index.html to index.html#/phones', () ->
      browser().navigateTo('../../app/index.html')
      expect(browser().location().hash()).toBe('/phones')

  describe 'Phone list view', () ->
    beforeEach () ->
      browser().navigateTo('../../app/index.html#/phones')

    it 'should filter the phone list as user types into the search box', () ->
      expect(repeater('.phones li').count()).toBe(20)

      input('query').enter('nexus')
      expect(repeater('.phones li').count()).toBe(1)

      input('query').enter('motorola')
      expect(repeater('.phones li').count()).toBe(8)

    it 'should be possible to control phone order via the drop down select box', () ->
      input('query').enter('tablet') #narrow the dataset to make the assertions shorter
      expect(repeater('.phones li', 'Phone List').column('a')).
          toEqual(["Motorola XOOM\u2122 with Wi-Fi", "MOTOROLA XOOM\u2122"])
      select('orderProp').option('alphabetical')
      expect(repeater('.phones li', 'Phone List').column('a')).
          toEqual(["MOTOROLA XOOM\u2122", "Motorola XOOM\u2122 with Wi-Fi"])

    it 'should render phone specific links', () ->
      input('query').enter('nexus')
      element('.phones li a').click()
      expect(browser().location().hash()).toBe('/phones/nexus-s')

  describe 'Phone detail view', () ->
    beforeEach () ->
      browser().navigateTo('../../app/index.html#/phones/nexus-s')

    it 'should display nexus-s page', () ->
      expect(binding('phone.name')).toBe('Nexus S')

    it 'should display the first phone image as the main phone image', () ->
      expect(element('img.phone').attr('src')).toBe('img/phones/nexus-s.0.jpg')

    it 'should swap main image if a thumbnail image is clicked on', () ->
      element('.phone-thumbs li:nth-child(3) img').click()
      expect(element('img.phone').attr('src')).toBe('img/phones/nexus-s.2.jpg')
      element('.phone-thumbs li:nth-child(1) img').click()
      expect(element('img.phone').attr('src')).toBe('img/phones/nexus-s.0.jpg')
