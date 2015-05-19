expect = require('chai').expect
context = require('../lib/react-css-coffee-loader')


describe 'CSS Context Loader', ->

  it 'should ignore anything that doesnt have `is`', ->

    before = '<div></div>'
    after = '<div></div>'

    expect(context(before)).to.equal(after)



  it 'should translate `is` to style on html elements', ->

    before = '<div is="conversationColumn"></div>'
    after = '<div style={ this.styles().conversationColumn }></div>'

    expect(context(before)).to.equal(after)



  it 'should translate `is` to styles on custom components', ->

    before = '<Custom is="ConversationColumn">'
    after = '<Custom {...this.styles().ConversationColumn}>'

    expect(context(before)).to.equal(after)



# describe 'Edge Cases', ->
#
#   it 'Case #1 - Spreads', ->
#
#     before =
#       'render: function() {
#         return React.createElement("div", {
#           "is": "conversationColumn"
#         },
#           React.createElement("div", {
#             "is": "userInfo"
#           },
#             React.createElement(UserInfo, React.__spread({}, this.props.user))
#           ),
#           React.createElement("div", {
#             "is": "messageList"
#           },
#             React.createElement(MessageList, {
#               "messages": this.props.messages
#             })
#           )
#         );
#       }'
#
#     after =
#       'render: function() {
#         return React.createElement("div", {
#           "style": this.styles().conversationColumn
#         },
#           React.createElement("div", {
#             "style": this.styles().userInfo
#           },
#             React.createElement(UserInfo, React.__spread({}, this.props.user))
#           ),
#           React.createElement("div", {
#             "style": this.styles().messageList
#           },
#             React.createElement(MessageList, {
#               "messages": this.props.messages
#             })
#           )
#         );
#       }'
#
#     expect(context(before)).to.equal(after)
#
#
#
#   it 'Case #2 - One Of Phils Files', ->
#
#     before =
#       'React.createElement("table", { "is": "root" },
#           React.createElement("tr", {},
#             React.createElement("td", {},
#               React.createElement(ComponentHeader, { "is": "header" , api: api, current: current})
#             )
#           ),
#           React.createElement("tr", {},
#             React.createElement("td", { "is": "tdHost" },
#               React.createElement(ComponentHost, {api: api, current: current})
#             )
#           )
#         )'
#
#     after =
#       'React.createElement("table", { "style": this.styles().root },
#           React.createElement("tr", {},
#             React.createElement("td", {},
#               React.createElement(ComponentHeader, { "style": this.styles().header , api: api, current: current})
#             )
#           ),
#           React.createElement("tr", {},
#             React.createElement("td", { "style": this.styles().tdHost },
#               React.createElement(ComponentHost, {api: api, current: current})
#             )
#           )
#         )'
#
#
#     expect(context(before)).to.equal(after)
#
#
#
#   it 'Case #3 - Component in a loop, not in return of render', ->
#
#     before =
#       'MessageList = React.createClass({
#         displayName: "MessageList",
#         mixins: [css.mixin],
#         classes: function() {
#           return {
#             "base": {
#               messageList: {
#                 background: "none"
#               }
#             }
#           };
#         },
#         style: function() {
#           return this.css("base");
#         },
#         render: function() {
#           var messageList;
#           messageList = [];
#           this.props.messages.forEach((function(_this) {
#             return function(message, i) {
#               var _ref;
#               return messageList.push(React.createElement(MessageItem, React.__spread({
#                 "is": "message",
#                 "key": i,
#                 "prev": ((_ref = _this.props.messages[i - 1]) != null ? _ref.type : void 0)
#               }, message)));
#             };
#           })(this));
#           return React.createElement("div", {
#             "is": "messageList"
#           }, messageList);
#         }
#       });'
#
#     after =
#       'MessageList = React.createClass({
#         displayName: "MessageList",
#         mixins: [css.mixin],
#         classes: function() {
#           return {
#             "base": {
#               messageList: {
#                 background: "none"
#               }
#             }
#           };
#         },
#         style: function() {
#           return this.css("base");
#         },
#         render: function() {
#           var messageList;
#           messageList = [];
#           this.props.messages.forEach((function(_this) {
#             return function(message, i) {
#               var _ref;
#               return messageList.push(React.createElement(MessageItem, React.__spread({
#                 "style": this.styles().message,
#                 "key": i,
#                 "prev": ((_ref = _this.props.messages[i - 1]) != null ? _ref.type : void 0)
#               }, message)));
#             };
#           })(this));
#           return React.createElement("div", {
#             "style": this.styles().messageList
#           }, messageList);
#         }
#       });'
#
#     expect(context(before)).to.equal(after)
