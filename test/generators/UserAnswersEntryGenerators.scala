package generators

import models._
import org.scalacheck.Arbitrary
import org.scalacheck.Arbitrary.arbitrary
import pages._
import play.api.libs.json.{JsValue, Json}

trait UserAnswersEntryGenerators extends PageGenerators with ModelGenerators {

  implicit lazy val arbitrarymyExamplePageUserAnswersEntry: Arbitrary[(MyExamplePagePage.type, JsValue)] =
    Arbitrary {
      for {
        page  <- arbitrary[MyExamplePagePage.type]
        value <- arbitrary[Boolean].map(Json.toJson(_))
      } yield (page, value)
    }
}
