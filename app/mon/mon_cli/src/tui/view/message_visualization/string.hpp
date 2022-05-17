/* ========================= eCAL LICENSE =================================
 *
 * Copyright (C) 2016 - 2019 Continental Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ========================= eCAL LICENSE =================================
*/
#pragma once

#include "ftxui/component/component_base.hpp"

#include "tui/view/component/scroller.hpp"
#include "tui/view/message_visualization/messaage_vizualization.hpp"

#include "tui/viewmodel/message_visualization/string.hpp"

#include <ftxui/dom/elements.hpp>

class StringMessageVisualizationView : public MessageVisualizationView
{
  std::shared_ptr<StringMessageVisualizationViewModel> view_model;

  ftxui::Component data_view = ftxui::Scroller(ftxui::Renderer([view_model=view_model] {
    using namespace ftxui;
    auto message = view_model->message();
    return paragraph(message) | size(WIDTH, EQUAL, 50);
  }));

protected:
  virtual ftxui::Component DataView() override
  {
    return data_view;
  }

public:
  StringMessageVisualizationView(std::shared_ptr<StringMessageVisualizationViewModel> vm)
    : MessageVisualizationView(vm), view_model{vm} { }
};
