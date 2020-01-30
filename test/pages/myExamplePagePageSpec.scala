package pages

import pages.behaviours.PageBehaviours

class myExamplePagePageSpec extends PageBehaviours {

  "myExamplePagePage" must {

    beRetrievable[Boolean](MyExamplePagePage)

    beSettable[Boolean](MyExamplePagePage)

    beRemovable[Boolean](MyExamplePagePage)
  }
}
