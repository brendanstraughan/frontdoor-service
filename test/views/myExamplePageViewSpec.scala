package views

import controllers.routes
import forms.myExamplePageFormProvider
import models.NormalMode
import play.api.data.Form
import play.twirl.api.HtmlFormat
import views.behaviours.YesNoViewBehaviours
import views.html.myExamplePageView

class myExamplePageViewSpec extends YesNoViewBehaviours {

  val messageKeyPrefix = "myExamplePage"

  val form = new myExamplePageFormProvider()()

  "myExamplePage view" must {

    val view = viewFor[myExamplePageView](Some(emptyUserAnswers))

    def applyView(form: Form[_]): HtmlFormat.Appendable =
      view.apply(form, NormalMode)(fakeRequest, messages)

    behave like normalPage(applyView(form), messageKeyPrefix)

    behave like pageWithBackLink(applyView(form))

    behave like yesNoPage(form, applyView, messageKeyPrefix, routes.myExamplePageController.onSubmit(NormalMode).url)
  }
}
