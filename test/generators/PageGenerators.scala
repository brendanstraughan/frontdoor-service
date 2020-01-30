package generators

import org.scalacheck.Arbitrary
import pages._

trait PageGenerators {

  implicit lazy val arbitrarymyExamplePagePage: Arbitrary[MyExamplePagePage.type] =
    Arbitrary(MyExamplePagePage)
}
