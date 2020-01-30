package views

import views.behaviours.ViewBehaviours
import views.html.TestPageView

class TestPageViewSpec extends ViewBehaviours {

  "TestPage view" must {

    val view = viewFor[TestPageView](Some(emptyUserAnswers))

    val applyView = view.apply()(fakeRequest, messages)

    behave like normalPage(applyView, "testPage")

    behave like pageWithBackLink(applyView)
  }
}
