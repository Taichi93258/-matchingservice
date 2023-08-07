import 'package:project/packages.dart';

class EditableTextField extends StatefulWidget {
  const EditableTextField(
      {Key? key,
      this.initialText,
      this.onSubmitted,
      this.onFocused,
      this.editable = true,
      this.multiline = false,
      this.isEditing = false})
      : super(key: key);

  final String? initialText;
  final void Function(String)? onSubmitted;
  final Function? onFocused;
  final bool editable;
  final bool multiline;
  final bool isEditing;
  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  final TextEditingController _editingController = TextEditingController();
  late bool _isEditing;

  @override
  void initState() {
    super.initState();
    _editingController.text = widget.initialText ?? "";
    _isEditing = widget.isEditing;
  }

  @override
  void didUpdateWidget(covariant EditableTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isEditing = widget.isEditing;
  }

  @override
  Widget build(BuildContext context) {
    infoLog('isEditing: $_isEditing');
    return _isEditing ? _editingMode() : _nonEditingMode();
  }

  Widget _editingMode() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: widget.multiline ? TextInputType.multiline : null,
            maxLines: widget.multiline ? 5 : 1,
            controller: _editingController,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (widget.onSubmitted != null) {
                widget.onSubmitted!(_editingController.text);
              }
            });
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }

  Widget _nonEditingMode() {
    return Row(
      children: [
        Expanded(
          child: Text(
            _editingController.text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        if (widget.editable)
          IconButton(
            onPressed: () {
              if (widget.editable) {
                if (widget.onFocused != null) {
                  widget.onFocused!();
                  infoLog("onFocused called");
                }
              }
            },
            icon: const Icon(Icons.edit),
          ),
      ],
    );
  }
}
