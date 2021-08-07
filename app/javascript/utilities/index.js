import PasswordsMatch from "./components/passwordsMatch"
import TableSorting from "./components/sorting"
import FormInline from "./components/form_inline"
import ProgressBar from "./components/progressBar"
import TestTimer from "./components/testTimer"

import { onLoad } from "./helpers"

onLoad(() => {
  FormInline.init()
  ProgressBar.init()
  TableSorting.init()
  PasswordsMatch.init()
  TestTimer.init()
})
