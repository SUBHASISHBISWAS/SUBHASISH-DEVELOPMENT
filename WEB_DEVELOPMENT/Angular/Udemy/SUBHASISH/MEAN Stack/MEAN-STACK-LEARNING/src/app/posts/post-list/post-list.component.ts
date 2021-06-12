import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Post } from '../post.model';
import { PostsService } from '../posts.service';
import { Subscription } from 'rxjs';
import { PageEvent } from '@angular/material/paginator';

@Component({
  selector: 'app-post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.css'],
})
export class PostListComponent implements OnInit, OnDestroy {
  posts: Post[] = [];
  private postSub: Subscription = new Subscription();
  isLoading: boolean = false;
  totalPost = 10;
  postPerPage = 2;
  pageSizeOptions = [2, 5, 10];
  constructor(private postService: PostsService) {}

  ngOnInit(): void {
    this.isLoading = true;
    this.postService.getPosts();
    this.postSub = this.postService
      .getPostUpdateListener()
      .subscribe((posts: Post[]) => {
        this.isLoading = false;
        this.posts = posts;
      });
  }
  ngOnDestroy() {
    this.postSub.unsubscribe();
  }

  onDelete(id: string) {
    this.postService.deletePost(id);
  }

  onChangePage(pageData: PageEvent) {}
}
