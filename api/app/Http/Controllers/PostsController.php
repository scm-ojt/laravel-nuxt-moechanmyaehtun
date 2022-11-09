<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\PostRequest;



class PostsController extends Controller
{
    public function index(){
       $posts= Post::orderBy('id','desc')->get();
        return $posts;
    }

    public function store(PostRequest $request){
        $post = new Post;
        $post->title = $request['title'];
        if(request()->file('image')!=null){
            $file = request()->file('image');
            unlink(public_path('img/'.$post->image));
            $file_name = uniqid(time()) . '_' . $file->getClientOriginalName();
            $save_path = ('img');
            $post->image = $save_path . "/$file_name";
            $file->move($save_path, $save_path . "/$file_name");
        }
        $post->save();
        return $post;
    }

    public function edit(Post $post)

    {
            return $post;

    }

    public function update( PostRequest $request, Post $post){
        $post->title = $request['title'];

            $file = request()->file('image');
            $file_name = uniqid(time()) . '_' . $file->getClientOriginalName();
            $save_path = ('img');
            $post->image = $save_path . "/$file_name";
            $file->move($save_path, $save_path . "/$file_name");
        $post->update();
        return $post;
    }
    public function delete(Post $post){
        $post->delete();
        return $post;

    }



}
