formTemplate ="
  <div class='registry-form card-info'>
    <a class='form-helper' href='#'' data-reveal-my-id='about-forms-modal'>
      <span class='icon ss-standard ss-help'></span>
    </a>
    <h2>DragForm Builder</h2>
    <div class='registry-form-container' style='border: 0'>
      <div class='additional-fields'>
        <h5 class='fieldset-title' data-bind='visible: remainingQuestionLimit().length > 0'> Aditional Information</h5>
        <ul id='select-options' class='field-list' data-bind='sortable: filteredList()'>
          <li class='custom-field ui-state-default'>
            <ul>
              <div data-bind='visible: mode() == \"show\"'>
                <li>
                  <ul class='controls'>
                    <li>
                      <a data-bind='click: edit' href='#'>
                        <span class='icon ss-standard ss-write'></span>
                        Editar
                      </a>
                    </li>
                    <li>
                      <a data-bind='click: function(){ $root.removeQuestion($data) }' href='#' class='delete'>
                        <span class='icon ss-standard ss-trash'></span>
                        Eliminar
                      </a>
                    </li>
                  </ul>
                  <span class='dragger-style ss-standard ss-move'></span>
                  <label data-bind='text: field().title()'></label> <span class='required-indicator' data-bind='visible: field().required()'> (requerido)</span>
                  <div class='small-input'>
                    <div data-bind='visible: field().type() == \"text\"'>
                      <input style='display:inline' type='text'>
                    </div>
                    <div data-bind='visible: field().type() == \"textarea\"'>
                      <textarea style='display:inline'></textarea>
                    </div>
                    <div data-bind='visible: field().type() == \"select\"'>
                      <label class='select-wrapper'>
                        <select data-bind='value: field().dup().type, foreach: field().options '>
                          <option data-bind='text: value'></option>
                        </select>
                      </label>
                    </div>
                  </div>
                  <span class='help' data-bind='text: field().helpText()'></span>
              </li>
            </ul>
            <div data-bind='visible: mode() == \"edit\"'>
              <form data-bind='with: editForm.field, submit: function() { $root.updateQuestion($data) }' id='new-form-field'>
                <ul class='form-field-container'>
                  <li class='form-field'>
                      <label>Question title</label>
                      <input type='text' id='new-field-title' data-bind='value: title' class='' title='This field is required'>
                  </li>
                  <li class='form-field'>
                      <label>
                        Help Text
                        <span class='optional'>(optional)</span>
                      </label>

                      <input type='text' data-bind='value: helpText'>
                  </li>
                  <li class='form-field'>
                      <label>
                        Question type
                        <span class='required'>*</span>
                      </label>
                      <label class='select-wrapper'>
                        <select data-bind='value: type, options: $root.newFieldForm.fieldTypesForSelect(), optionsText: \"text\", optionsValue: \"value\"'></select>
                      </label>
                      <!-- ko if: type() == \"select\" -->
                      <span class='validationMessage' data-bind='validationMessage: $parent.editForm.field().options'></span>
                      <!-- /ko -->
                  </li>
                  <li class='add-select'>
                      <div data-bind='visible: type() == \"text\"'>
                          <input style='display:inline' type='text' placeholder='Your answer' readonly=''>
                      </div>
                      <div data-bind='visible: type() == \"textarea\"'>
                          <textarea style='display:inline' placeholder='Su párrafo' readonly=''></textarea>
                      </div>
                      <div data-bind='visible: type() == \"select\"'>
                        <span>Opciones:</span>
                        <ul class='select-options' data-bind='foreach: $parent.editForm.field().options()'>
                          <li>
                            <input type='text' data-bind='value: value, hasfocus: true'/>
                            <a class='delete' href='#' data-bind='click: function() { return $parents[1].editForm.fieldType().removeOption($data) }'>
                              <span class='icon ss-standard ss-delete'></span>
                            </a>
                          </li>
                        </ul>
                        <input style='display:inline' type='text' placeholder='Click to add option' readonly='' data-bind='click: function() { return $parent.editForm.fieldType().addOption($data) }' >
                      </div>
                  </li>
                  <li class='form-field'>
                    <label>
                      <input style='display:inline' data-bind='checked: required, attr: {value: $root.newFieldForm.field().required}' type='checkbox' placeholder='Your answer' readonly=''>
                      This question is mandatory
                      </label>
                  </li>
                  <li class='form-action'>
                    <button class='button button-secondary button-medium'>Save changes</button>
                    <a class='cancel button button-medium button-link' href='#' data-bind='click: $parent.cancel'>Cancel</a>
                  </li>
                </ul>
              </form>
            </div>
          </li>
        </ul>
      </div>
      <div data-bind='visible: remainingQuestionLimit() == 0'>
        <div class='system-message notice o-max-questions-warning'>
          You have reach the limit of <strong>20</strong> questions.
          <a data-reveal-my-id='about-questions-modal' href='#'>¿Why only 20?</a>
        </div>
      </div>

    </div>
  </div>

  <div class='add-field card-info' data-bind='visible: remainingQuestionLimit() > 0'>
    <h5 class='fieldset-title'>Add up to <strong data-bind='text: remainingQuestionLimit()'></strong> questions</h5>
    <form data-bind='with: newFieldForm.field, submit: addQuestion' id='new-form-field'>
      <ul class='form-field-container'>
      <li class='form-field grid-row'>
        <div class='col4 text-right'>
          <label>Question title</label>
        </div>
        <div class='col8'>
          <input type='text' id='new-field-title' data-bind='value: title, hasfocus: true' title='This field is required'>
        </div>
      </li>
      <li class='form-field grid-row'>
        <div class='col4 text-right'>
          <label>
            Help Text
            <span class='optional'>(optional)</span>
          </label>
        </div>
        <div class='col8'>
          <input type='text' data-bind='value: helpText'>
        </div>
      </li>
      <li class='form-field grid-row'>
        <div class='col4 text-right'>
          <label>
            Question type
            <span class='required'>*</span>
          </label>
        </div>
        <div class='col8'>
          <label class='select-wrapper'>
            <select data-bind='value: type, options: $root.newFieldForm.fieldTypesForSelect(), optionsText: \"text\", optionsValue: \"value\"'></select>
          </label>
          <!-- ko if: $root.newFieldForm.isFieldType(\"select\") -->
          <span class='validationMessage' data-bind='validationMessage: $root.newFieldForm.field().options'></span>
          <!-- /ko -->
        </div>
      </li>
      <li class='grid-row add-select'>
        <div class='push4-l col8'>
          <div data-bind='visible: $root.newFieldForm.isFieldType(\"text\")'>
            <input style='display:inline' type='text' placeholder='Your answer' readonly=''>
          </div>
          <div data-bind='visible: $root.newFieldForm.isFieldType(\"textarea\")'>
            <textarea style='display:inline' placeholder='Su párrafo' readonly=''></textarea>
          </div>
          <div data-bind='visible: $root.newFieldForm.isFieldType(\"select\")'>
            <span>Opciones:</span>
            <ul class='select-options' data-bind='foreach: $root.newFieldForm.field().options()'>
              <li>
                <input type='text' data-bind='value: value, hasfocus: true'/>
                <a class='delete' href='#' data-bind='click: function() { return $root.newFieldForm.fieldType().removeOption($data) }'>
                  <span class='icon ss-standard ss-delete'></span>
                </a>
              </li>
            </ul>
            <input style='display:inline' type='text' placeholder='Click to add option' readonly='' data-bind='click: function() { return $root.newFieldForm.fieldType().addOption() }' >
          </div>
        </div>
      </li>
      <li class='form-field grid-row'>
        <div class='push4-l col8'>
          <label>
            <input style='display:inline' data-bind='checked: required, attr: {value: $root.newFieldForm.field().required}' type='checkbox' placeholder='Your answer' readonly=''>
            This question is mandatory
          </label>
        </div>
      </li>
      <li class='form-action grid-row'>
        <div class='push4-l col8'>
          <button class='button button-secondary button-default'>Add question</button>
        </div>
      </li>
    </ul>
  </form>
</div>"

module.exports = formTemplate
