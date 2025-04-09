import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAvatar extends StatelessWidget {
  final String imagePath;
  final double size;
  final bool isStory;

  const CustomAvatar({
    Key? key,
    required this.imagePath,
    this.size = 40.0,
    this.isStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Debug: Print the image path
    print('Loading image: $imagePath');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isStory ? Theme.of(context).primaryColor : Colors.grey[300]!,
          width: isStory ? 2.0 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image $imagePath: $error');
            return Container(
              color: Colors.grey[200],
              child: Icon(
                isStory ? Icons.person : Icons.group,
                color: Colors.grey[600],
                size: size * 0.5,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _showChats = true;

  // Profile images
  final List<String> _userProfileImages = [
    'assets/images/profiles/user1.png.jpg',
    'assets/images/profiles/user2.png.jpg',
    'assets/images/profiles/user3.png.jpg',
    'assets/images/profiles/user4.png.jpg',
    'assets/images/profiles/user5.png.jpg',
  ];

  final List<String> _groupProfileImages = [
    'assets/images/profiles/group1.png.jpg',
    'assets/images/profiles/group2.png.jpg',
    'assets/images/profiles/group3.png.jpg',
    'assets/images/profiles/group4.png.jpg',
    'assets/images/profiles/group5.png.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Stories section
          Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                // Add story button
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 60,
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.grey[300]!, width: 1),
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.grey[200],
                            child: const Icon(Icons.add,
                                size: 24, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Add Story',
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                // Sample story avatars
                ...List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          CustomAvatar(
                            imagePath: _userProfileImages[index],
                            size: 60,
                            isStory: true,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${index + 1} User',
                            style: const TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Custom Tab Bar
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _showChats = false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: !_showChats
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Groups',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: !_showChats
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            fontWeight: !_showChats
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _showChats = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _showChats
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Chats',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _showChats
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            fontWeight: _showChats
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          Expanded(
            child: _showChats ? _buildChatsTab() : _buildGroupsTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatsTab() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        final imageIndex = index % _userProfileImages.length;
        return ListTile(
          leading: CustomAvatar(
            imagePath: _userProfileImages[imageIndex],
            size: 40,
          ),
          title: Text('${index + 1} User'),
          subtitle: const Text('Last message...'),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${index + 1}:00 PM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              if (index % 3 == 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () {
            // Handle chat item tap
          },
        );
      },
    );
  }

  Widget _buildGroupsTab() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CustomAvatar(
            imagePath: _groupProfileImages[index],
            size: 40,
          ),
          title: Text('${index + 1} Group'),
          subtitle: const Text('Last group message...'),
          trailing: Text(
            '${index + 1}:00 PM',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          onTap: () {
            // Handle group chat tap
          },
        );
      },
    );
  }
}
