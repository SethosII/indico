<% declareTemplate(newTemplateStyle=True) %>

<% from MaKaC.reviewing import ConferenceReview %>
<% from MaKaC.reviewing import Template %>
<% from MaKaC.common.utils import formatDateTime %>

<table width="90%%" align="center" border="0" style="margin-bottom:1em">
    <tr>
        <em><%= _("Please, follow the steps to set up the Paper Reviewing Module")%></em> 
        <div id="reviewingModeHelp" class="groupTitle"><%= _("Step 1: Choose type of paper reviewing for the conference")%></div>
    </tr>
    <tr>
        <td nowrap class="titleCellTD"  style="padding-top: 5px;">
            <span class="titleCellFormat"><%= _("Type of reviewing:")%></span>
        </td>
        <td nowrap style="vertical-align:top; padding-top: 5px;">
            <span id="inPlaceEditReviewingMode" style="display:inline"><%= ConferenceReview.reviewingModes[choice] %></span>
        </td>
    </tr>
</table>
<% if ConfReview.hasReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id='steptitle' width="90%%" border="0" style="margin-bottom:1em; display:<%=display%>">
    <tr>
        <td class="groupTitle">
            <%= _("Step 2: Set up the options for ")%><span id="title">
            <%if ConferenceReview.reviewingModes[choice]==ConferenceReview.reviewingModes[2]: %><%= _("content reviewing team")%><% end %>
            <%if ConferenceReview.reviewingModes[choice]==ConferenceReview.reviewingModes[3]: %><%= _("layout reviewing team")%><% end %>
            <%if ConferenceReview.reviewingModes[choice]==ConferenceReview.reviewingModes[4]: %><%= _("content and layout reviewing team")%><% end %>
            </span>
        </td>
    </tr>
</table>
<% if ConfReview.hasReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id='materialsTable' width="90%%" align="center" border="0" style="margin-bottom:1em; display:<%=display%>">    
    <tr>
        <td id="reviewableMaterialsHelp" colspan="5" class="reviewingsubtitle" style="padding-top: 20px;">
            <span><%= _("Choose types of materials to be revised")%></span>
        </td>
    </tr>
    <tr>
        <td>
           <div id="inPlaceEditReviewableMaterials"  style="padding-top: 5px;"><%=", ".join(ConfReview.getReviewableMaterials()) %></div> 
        </td>
    </tr>
</table>

<% if ConfReview.hasPaperReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id='statusTable' width="90%%" align="center" border="0" style="margin-bottom:1em; display:<%=display%>">
    <tr>
        <td id="reviewingStatesHelp" colspan="5" class="reviewingsubtitle"><%= _("Add a paper status for paper reviewing")%></td>
    </tr>
    <tr>
        
    </tr>
    <!--
    <tr>
    <form action=<%=addStateURL%> method="post">
        <%= stateAdd %>
    </form>
    </tr>
    <tr>
        <form action=<%=removeStateURL%> method="post">
            <td bgcolor="white" width="50%%" valign="top" class="blacktext">
                <%= stateTable %>
            </td>
            
        </form>
    </tr>
    -->
    <tr>
        <td style="width: 400px;">    
            <div id="inPlaceEditStates"  style="padding-top: 5px;"><%= ', '.join(ConfReview.getAllStates())%></div>
        </td>
        <td>
            <div class="titleCellFormat">
                <%= _("Statuses by default:")%>
                <ul class="keywordList">
                <li class="multipleLinesListItem">                    
                    <%=ConferenceReview.predefinedStates[0] %>
                </li>  
                <li class="multipleLinesListItem">                    
                    <%=ConferenceReview.predefinedStates[1] %>
                </li>  
                <li class="multipleLinesListItem">                    
                    <%=ConferenceReview.predefinedStates[2] %>
                </li>        
                </ul>
            </div>
        </td>
    </tr>
</table>

<% if ConfReview.hasPaperReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id="reviewingQuestionsTable" width="90%%" align="center" border="0" style="margin-bottom:1em; display:<%=display%>">
    <tr>
        <td id="reviewingQuestionsHelp" colspan="5" class="reviewingsubtitle"><%= _("Add questions for content reviewing")%></td>
    </tr>
    <!--
    <tr>
        <form action=<%=addQuestionURL%> method="post">
            <%= questionAdd %>
        </form>
    </tr>
    <tr>
        <form action=<%=removeQuestionURL%> method="post">
          <td bgcolor="white" width="50%%" valign="top" class="blacktext">
              <%= questionTable%>
          </td>
        </form>
    </tr>
    -->
    <tr>
        <td>
            <div id="inPlaceEditQuestions"  style="padding-top: 5px;"><%= ', '.join(ConfReview.getReviewingQuestions())%></div>
        </td>
    </tr>
</table>


<% if ConfReview.hasPaperEditing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id="editingCriteriaTable" width="90%%" align="center" border="0" style="margin-bottom:1em; display:<%=display%>">
    <tr>
        <td id="editingCriteriaHelp" colspan="5" class="reviewingsubtitle"  style="padding-top: 5px;"><%= _("Set criteria for layout reviewing")%></td>
    </tr>
    <!--
    <tr>
        <form action=<%=addCriteriaURL%> method="post">
            <%= criteriaAdd %>
            </form>
    </tr>
    <tr>
        <form action=<%=removeCriteriaURL%> method="post">
        <td bgcolor="white" width="50%%" valign="top" class="blacktext">
             <%= criteriaTable %>
        </td>
        </form>
    </tr>
    -->
    <tr>
        <td>
            <div id="inPlaceEditCriteria"  style="padding-top: 10px;"><%= ', '.join(ConfReview.getLayoutCriteria())%></div>
        </td>
    </tr>
</table>


<% if ConfReview.hasReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id="defaultDueDatesTable" width="90%%" align="center" border="0" style="margin-bottom:1em; display:<%=display%>">
    <tr>
        <td id="defaultDatesHelp" colspan="5" class="reviewingsubtitle"><%= _("Deadlines for reviewing team")%></td>
    </tr>
    <% if ConfReview.hasPaperReviewing(): %>
        <% display = 'table-row' %>
    <% end %>
    <% else: %>
        <% display = 'none' %>
    <% end %>    
    <tr id="refereeDefaultDateRow" style="white-space:nowrap; display: <%=display%>">
        <td nowrap class="titleCellTD"><span class="titleCellFormat">
            <%= _("Referee Deadline")%>
        </span></td>
        <td nowrap class="blacktext">
            <span id="inPlaceEditDefaultRefereeDueDate">
                <% date = ConfReview.getAdjustedDefaultRefereeDueDate() %>
                <% if date is None: %>
                    <%= _("Date has not been set yet.")%>
                <% end %>
                <% else: %>
                    <%= formatDateTime(date) %>
                <% end %>
            </span>
        </td>
    </tr>
    <% if ConfReview.hasPaperEditing(): %>
        <% display = 'table-row' %>
    <% end %>
    <% else: %>
        <% display = 'none' %>
    <% end %>    
    <tr id="editorDefaultDateRow" style="white-space:nowrap; display: <%=display%>">
        <td nowrap class="titleCellTD"><span class="titleCellFormat">
            <%= _("Editor Deadline")%>
        </span></td>
        <td nowrap class="blacktext">
            <span id="inPlaceEditDefaultEditorDueDate">
                <% date = ConfReview.getAdjustedDefaultEditorDueDate() %>
                <% if date is None: %>
                    <%= _("Date has not been set yet.")%>
                <% end %>
                <% else: %>
                    <%= formatDateTime(date) %>
                <% end %>
            </span>
        </td>
        <% if not ConfReview.hasPaperReviewing(): %>
            <% display = 'table-row' %>
        <% end %>
        <% else: %>
            <% display = 'none' %>
        <% end %>   
    </tr>
    <% if ConfReview.hasPaperReviewing(): %>
        <% display = 'table-row' %>
    <% end %>
    <% else: %>
        <% display = 'none' %>
    <% end %>    
    <tr id="reviewerDefaultDateRow" style="white-space:nowrap;display: <%=display%>">
        <td nowrap class="titleCellTD"><span class="titleCellFormat">
            <%= _("Reviewer Deadline")%>
        </span></td>
        <td nowrap class="blacktext">
            <span id="inPlaceEditDefaultReviewerDueDate">
                <% date = ConfReview.getAdjustedDefaultReviewerDueDate() %>
                <% if date is None: %>
                    <%= _("Date has not been set yet.")%>
                <% end %>
                <% else: %>
                    <%= formatDateTime(date) %>
                <% end %>
            </span>
        </td>
    </tr>
</table>


<% if ConfReview.hasReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<table id="defaultDueDatesTable" width="90%%" align="center" border="0" style="margin-bottom:1em; display:<%=display%>">
    <tr>
        <td id="defaultDatesHelp" colspan="5" class="reviewingsubtitle"><%= _("Automatic mails")%></td>
    </tr>
    

<% if ConfReview.hasReviewing(): %>
    <% display = 'table' %>
<% end %>
<% else: %>
    <% display = 'none' %>
<% end %>
<form action="<%= setTemplateURL %>" method="post" ENCTYPE="multipart/form-data">
<table id="templateTable" width="90%%" align="center" border="0" style="display:<%=display%>">
    <tr>
        <td id="uploadTemplateHelp" colspan="5" class="reviewingsubtitle"><%= _("Upload a template")%></td>
    </tr>
    <tr>
        <td>
            <table>
            	<tr>
            		<td align="right">
            			<%= _("Name")%>
            		</td>
					<td>
						<input type=text size="70" name="name">
					</td>
            	</tr>
                <tr>
                    <td align="right">
                        <%= _("Description")%>
                    </td>
                    <td>
                        <textarea rows="2" cols="53" name="description">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%= _("Format")%>
                    </td>
                    <td id='formatchooser'>                        
                    </td>
                    
                </tr>
				<tr>
                    <td align="right">
                        <%= _("Template")%>
                    </td>
                    <td>
                        <input name="file" type="file" value="<%= _("Browse...")%>">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <input type="submit" class="btn" value="<%= _("Upload")%>">
        </td>
    </tr>
    <tr><td>
        <% includeTpl ('ContributionReviewingTemplatesList', ConfReview = ConfReview, CanDelete = CanDelete)%>
    </tr></td>    
</table>
</form>

<script type="text/javascript">

var observer = function(value) {
    
    if (value == "No reviewing") {
        $E('steptitle').dom.style.display = 'none';
        $E('materialsTable').dom.style.display = 'none';
        $E('statusTable').dom.style.display = 'none';
        $E('reviewingQuestionsTable').dom.style.display = 'none';
        $E('editingCriteriaTable').dom.style.display = 'none';
        $E('defaultDueDatesTable').dom.style.display = 'none';
        $E('refereeDefaultDateRow').dom.style.display = 'none';
        $E('editorDefaultDateRow').dom.style.display = 'none';
        $E('reviewerDefaultDateRow').dom.style.display = 'none';
        $E('templateTable').dom.style.display = 'none';
    }
    if (value == "Content reviewing") {
        $E('steptitle').dom.style.display = '';
        $E('title').set('<%= _("content reviewing team")%>');
        $E('materialsTable').dom.style.display = '';
        $E('statusTable').dom.style.display = '';
        $E('reviewingQuestionsTable').dom.style.display = '';
        $E('editingCriteriaTable').dom.style.display = 'none';
        $E('defaultDueDatesTable').dom.style.display = '';
        $E('refereeDefaultDateRow').dom.style.display = '';
        $E('editorDefaultDateRow').dom.style.display = 'none';
        $E('reviewerDefaultDateRow').dom.style.display = '';
        $E('templateTable').dom.style.display = '';
        
        showReviewableMaterials();
        showReviewingStates();
        showReviewingQuestions();
        showDefaultReviewerDate();
        showDefaultRefereeDate();
        showFormatChooser();
    }
    if (value == "Layout reviewing") {
        $E('steptitle').dom.style.display = '';
        $E('title').set('<%= _("layout reviewing team")%>');
        $E('materialsTable').dom.style.display = '';
        $E('statusTable').dom.style.display = 'none';
        $E('reviewingQuestionsTable').dom.style.display = 'none';
        $E('editingCriteriaTable').dom.style.display = '';
        $E('defaultDueDatesTable').dom.style.display = '';
        $E('refereeDefaultDateRow').dom.style.display = 'none';
        $E('editorDefaultDateRow').dom.style.display = '';
        $E('reviewerDefaultDateRow').dom.style.display = 'none';
        $E('templateTable').dom.style.display = '';
        
        showReviewableMaterials();
        showEditingCriteria();
        showDefaultEditorDate();
        showFormatChooser();
    }
    if (value == "Content and layout reviewing") {
        $E('steptitle').dom.style.display = '';
        $E('title').set('<%= _("content and layout reviewing team")%>');
        $E('materialsTable').dom.style.display = '';
        $E('statusTable').dom.style.display = '';
        $E('reviewingQuestionsTable').dom.style.display = '';
        $E('editingCriteriaTable').dom.style.display = '';
        $E('defaultDueDatesTable').dom.style.display = '';
        $E('refereeDefaultDateRow').dom.style.display = '';
        $E('editorDefaultDateRow').dom.style.display = '';
        $E('reviewerDefaultDateRow').dom.style.display = '';
        $E('templateTable').dom.style.display = '';
        
        showReviewableMaterials();
        showReviewingStates();
        showReviewingQuestions();
        showDefaultReviewerDate();
        showDefaultRefereeDate();
        showEditingCriteria();
        showDefaultEditorDate();
        showFormatChooser();
    }
}

new IndicoUI.Widgets.Generic.selectionField($E('inPlaceEditReviewingMode'),
                    'reviewing.conference.changeReviewingMode',
                    {conference: '<%= ConfReview.getConference().getId() %>'},
                    <%= ConferenceReview.reviewingModes[1:] %>,
                    "<%= ConfReview.getReviewingMode() %>",
                    observer);                    

var showReviewableMaterials = function() {
    new IndicoUI.Widgets.Generic.twoListField($E('inPlaceEditReviewableMaterials'),
                        10,"200px",<%=ConfReview.getNonReviewableMaterials()%>,<%=ConfReview.getReviewableMaterials()%>,
                        $T("Non reviewable materials"), $T("Reviewable materials"),
                        'reviewing.conference.changeReviewableMaterials',
                        {conference: '<%= ConfReview.getConference().getId() %>'},
                        '');
}

               
var showReviewingStates = function() {
    new IndicoUI.Widgets.Generic.keywordField(
        $E('inPlaceEditStates'),
        'multipleLinesListItem',
        'reviewing.conference.changeStates',
        {conference: '<%= ConfReview.getConference().getId() %>'},
        $T('Remove this status from the list')
    );
}

var showReviewingQuestions = function() {
    new IndicoUI.Widgets.Generic.keywordField(
        $E('inPlaceEditQuestions'),
        'multipleLinesListItem',
        'reviewing.conference.changeQuestions',
        {conference: '<%= ConfReview.getConference().getId() %>'},
        $T('Remove this question from the list')
    );
}

var showEditingCriteria = function() {
    new IndicoUI.Widgets.Generic.keywordField(
        $E('inPlaceEditCriteria'),
        'multipleLinesListItem',
        'reviewing.conference.changeCriteria',
        {conference: '<%= ConfReview.getConference().getId() %>'},
        $T('Remove this criteria from the list')
    );
}

var showDefaultRefereeDate = function() {
    new IndicoUI.Widgets.Generic.dateEditor($E('inPlaceEditDefaultRefereeDueDate'),
                       'reviewing.conference.changeDefaultDueDate',
                       {conference: '<%= ConfReview.getConference().getId() %>',
                        dueDateToChange: 'Referee'},
                       null, true);
}
               
var showDefaultEditorDate = function() {
    new IndicoUI.Widgets.Generic.dateEditor($E('inPlaceEditDefaultEditorDueDate'),
                       'reviewing.conference.changeDefaultDueDate',
                       {conference: '<%= ConfReview.getConference().getId() %>',
                        dueDateToChange: 'Editor'},
                       null, true);
}

var showDefaultReviewerDate = function() {
    new IndicoUI.Widgets.Generic.dateEditor($E('inPlaceEditDefaultReviewerDueDate'),
                       'reviewing.conference.changeDefaultDueDate',
                       {conference: '<%= ConfReview.getConference().getId() %>',
                        dueDateToChange: 'Reviewer'},
                       null, true);
}

IndicoUI.executeOnLoad(function(){
    var pm = new IndicoUtil.parameterManager();    
    
    
    return $E('formatchooser').set(showFormatChooser(pm));
});

function showFormatChooser(pm){
    var select = Html.select({name: 'format'}, Html.option({value: "Unknown"}, "--Select a format--")<% for f in Template.formats: %>,Html.option({value: "<%= f %>"}, "<%= f %>")<%end%>);
    var text = Html.edit({name: 'formatOther'});
    var chooser = new Chooser(new Lookup({
            select: function() {
                pm.remove(text);
                pm.add(select);
               var sel = '<select name="format" id="defaultformat">'+
                         '<option value="Unknown"><%= _("--Select a format--")%></option>'+  
                         '<% for f in Template.formats: %>'+ 
                         '<option value="<%= f %>"><%= f %></option>'+
                         '<% end %>'+
                         '</select>';
                return Html.div({},select,
                         " ",
                         $T("or"),
                         " ",
                         Widget.link(command(function() {
                             chooser.set('write');
                         }, $T("other"))));
            },

            write: function() {
                bind.detach(select);
                pm.remove(select);
                pm.add(text);
                return Html.div({}, text,
                                " ",
                               $T("or"),
                               " ",
                                Widget.link(command(function() {
                                    chooser.set('select');
                                }, $T("select from list"))));
            }
        }));
        chooser.set('select');

        return Widget.block(chooser);
}
                 
<% if ConfReview.hasReviewing(): %>
    showReviewableMaterials();
<% end %>
<% if ConfReview.hasPaperReviewing(): %>
    showReviewingStates();
    showReviewingQuestions();
    showDefaultReviewerDate();
    showDefaultRefereeDate();
<% end %>
<% if ConfReview.hasPaperEditing(): %>
    showEditingCriteria();
    showDefaultEditorDate();
<% end %>

</script>