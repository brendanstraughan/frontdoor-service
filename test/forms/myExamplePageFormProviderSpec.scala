package forms

import forms.behaviours.BooleanFieldBehaviours
import play.api.data.FormError

class myExamplePageFormProviderSpec extends BooleanFieldBehaviours {

  val requiredKey = "myExamplePage.error.required"
  val invalidKey = "error.boolean"

  val form = new myExamplePageFormProvider()()

  ".value" must {

    val fieldName = "value"

    behave like booleanField(
      form,
      fieldName,
      invalidError = FormError(fieldName, invalidKey)
    )

    behave like mandatoryField(
      form,
      fieldName,
      requiredError = FormError(fieldName, requiredKey)
    )
  }
}
