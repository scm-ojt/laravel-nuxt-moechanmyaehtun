<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\PostRequest;



class PostsController extends Controller
{
    public function index(Request $request){

        if($request['title']!= null){
            $posts = Post::where('title','LIKE','%'.$request->title.'%')->orderBy('id', 'desc');
        }else{
            $posts = Post::orderBy('id', 'desc')->get();

        }
        return $posts;

    }

    public function store(PostRequest $request){
        $post = new Post;
        $post->title = $request['title'];
            $file = request()->file('image');
            $file_name = uniqid(time()) . '_' . $file->getClientOriginalName();
            $save_path = ('img');
            $post->image = $save_path . "/$file_name";
            $file->move($save_path, $save_path . "/$file_name");
        $post->save();
        return $post;
    }

    public function edit(Post $post)

    {
            return $post;

    }

    public function update( PostRequest $request, Post $post){
        $post->title = $request['title'];
        if(request()->file('image')){
            $file = request()->file('image');
            $file_name = uniqid(time()) . '_' . $file->getClientOriginalName();
            unlink(public_path($post->image));
            $save_path = ('img');
            $post->image = $save_path . "/$file_name";
            $file->move($save_path, $save_path . "/$file_name");
        }
        $post->save();
        return $post;
    }
    public function delete(Post $post){
        $post->delete();
        return $post;

    }



}
