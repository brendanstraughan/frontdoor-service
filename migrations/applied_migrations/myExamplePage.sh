#!/bin/bash

echo ""
echo "Applying migration myExamplePage"

echo "Adding routes to conf/app.routes"

echo "" >> ../conf/app.routes
echo "GET        /myExamplePage                        controllers.myExamplePageController.onPageLoad(mode: Mode = NormalMode)" >> ../conf/app.routes
echo "POST       /myExamplePage                        controllers.myExamplePageController.onSubmit(mode: Mode = NormalMode)" >> ../conf/app.routes

echo "GET        /changemyExamplePage                  controllers.myExamplePageController.onPageLoad(mode: Mode = CheckMode)" >> ../conf/app.routes
echo "POST       /changemyExamplePage                  controllers.myExamplePageController.onSubmit(mode: Mode = CheckMode)" >> ../conf/app.routes

echo "Adding messages to conf.messages"
echo "" >> ../conf/messages.en
echo "myExamplePage.title = myExamplePage" >> ../conf/messages.en
echo "myExamplePage.heading = myExamplePage" >> ../conf/messages.en
echo "myExamplePage.checkYourAnswersLabel = myExamplePage" >> ../conf/messages.en
echo "myExamplePage.error.required = Select yes if myExamplePage" >> ../conf/messages.en

echo "Adding to UserAnswersEntryGenerators"
awk '/trait UserAnswersEntryGenerators/ {\
    print;\
    print "";\
    print "  implicit lazy val arbitrarymyExamplePageUserAnswersEntry: Arbitrary[(myExamplePagePage.type, JsValue)] =";\
    print "    Arbitrary {";\
    print "      for {";\
    print "        page  <- arbitrary[myExamplePagePage.type]";\
    print "        value <- arbitrary[Boolean].map(Json.toJson(_))";\
    print "      } yield (page, value)";\
    print "    }";\
    next }1' ../test/generators/UserAnswersEntryGenerators.scala > tmp && mv tmp ../test/generators/UserAnswersEntryGenerators.scala

echo "Adding to PageGenerators"
awk '/trait PageGenerators/ {\
    print;\
    print "";\
    print "  implicit lazy val arbitrarymyExamplePagePage: Arbitrary[myExamplePagePage.type] =";\
    print "    Arbitrary(myExamplePagePage)";\
    next }1' ../test/generators/PageGenerators.scala > tmp && mv tmp ../test/generators/PageGenerators.scala

echo "Adding to UserAnswersGenerator"
awk '/val generators/ {\
    print;\
    print "    arbitrary[(myExamplePagePage.type, JsValue)] ::";\
    next }1' ../test/generators/UserAnswersGenerator.scala > tmp && mv tmp ../test/generators/UserAnswersGenerator.scala

echo "Adding helper method to CheckYourAnswersHelper"
awk '/class/ {\
     print;\
     print "";\
     print "  def myExamplePage: Option[AnswerRow] = userAnswers.get(myExamplePagePage) map {";\
     print "    x =>";\
     print "      AnswerRow(";\
     print "        HtmlFormat.escape(messages(\"myExamplePage.checkYourAnswersLabel\")),";\
     print "        yesOrNo(x),";\
     print "        routes.myExamplePageController.onPageLoad(CheckMode).url";\
     print "      )"
     print "  }";\
     next }1' ../app/utils/CheckYourAnswersHelper.scala > tmp && mv tmp ../app/utils/CheckYourAnswersHelper.scala

echo "Migration myExamplePage completed"
