import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.go('/welcome');
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        String? userId;

        if (state is AuthAuthenticated) {
          userId = state.user.id;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('CAMPUS CONNECT'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                },
              ),
            ],
          ),
          body: Column(
            children: [
              const Center(
                child: Text(
                  "HOME PAGE CAMPUS CONNECT",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (userId == null) return; // safety

                  context.push(
                    '/attendance',
                    extra: {'userId': userId, 'subjectId': 'English'},
                  );
                },
                child: const Text("Attendance Page"),
              ),
            ],
          ),
        );
      },
    );
  }
}




// backgroundColor: Colors.white,
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             title: const Text('CAMPUS CONNECT'),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.logout),
//                 onPressed: () {
//                   context.read<AuthBloc>().add(LogoutRequested());
//                 },
//               ),
//             ],
//           ),