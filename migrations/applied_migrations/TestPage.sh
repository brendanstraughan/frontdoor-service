#!/bin/bash

echo ""
echo "Applying migration TestPage"

echo "Adding routes to conf/app.routes"
echo "" >> ../conf/app.routes
echo "GET        /testPage                       controllers.TestPageController.onPageLoad()" >> ../conf/app.routes

echo "Adding messages to conf.messages"
echo "" >> ../conf/messages.en
echo "testPage.title = testPage" >> ../conf/messages.en
echo "testPage.heading = testPage" >> ../conf/messages.en

echo "Migration TestPage completed"
