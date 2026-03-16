'use client';

import { useState } from 'react';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import {
  Upload,
  BarChart3,
  Package,
  Heart,
  Eye,
  Download,
  TrendingUp,
  Plus,
  Edit,
  Trash2,
} from 'lucide-react';

export default function CreatorDashboard() {
  const [activeTab, setActiveTab] = useState('overview');

  // Mock data
  const stats = {
    totalIcons: 24,
    totalDownloads: 1234,
    totalViews: 5678,
    totalLikes: 89,
  };

  const icons = [
    { id: '1', name: 'home-outline', downloads: 234, views: 567, likes: 12, status: 'active', createdAt: '2024-01-15' },
    { id: '2', name: 'settings-outline', downloads: 189, views: 432, likes: 8, status: 'active', createdAt: '2024-01-14' },
    { id: '3', name: 'user-outline', downloads: 156, views: 389, likes: 6, status: 'active', createdAt: '2024-01-13' },
    { id: '4', name: 'mail-outline', downloads: 98, views: 234, likes: 4, status: 'pending', createdAt: '2024-01-12' },
  ];

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Header */}
      <header className="bg-white border-b">
        <div className="container mx-auto px-4 py-4 flex justify-between items-center">
          <Link href="/" className="text-xl font-bold text-blue-600">
            IconHub
          </Link>
          <div className="flex items-center gap-4">
            <span className="text-sm text-muted-foreground">creator@example.com</span>
            <div className="w-8 h-8 bg-blue-600 rounded-full flex items-center justify-center text-white">
              C
            </div>
          </div>
        </div>
      </header>

      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          {/* Sidebar */}
          <div className="md:col-span-1">
            <div className="bg-white rounded-xl border p-4 space-y-2">
              <h2 className="font-semibold px-3 py-2">Menu</h2>
              <Button
                variant={activeTab === 'overview' ? 'secondary' : 'ghost'}
                className="w-full justify-start"
                onClick={() => setActiveTab('overview')}
              >
                <BarChart3 className="w-4 h-4 mr-2" />
                Overview
              </Button>
              <Button
                variant={activeTab === 'icons' ? 'secondary' : 'ghost'}
                className="w-full justify-start"
                onClick={() => setActiveTab('icons')}
              >
                <Package className="w-4 h-4 mr-2" />
                My Icons
              </Button>
              <Button
                variant={activeTab === 'upload' ? 'secondary' : 'ghost'}
                className="w-full justify-start"
                onClick={() => setActiveTab('upload')}
              >
                <Upload className="w-4 h-4 mr-2" />
                Upload
              </Button>
              <Button variant="ghost" className="w-full justify-start">
                <Heart className="w-4 h-4 mr-2" />
                Favorites
              </Button>
            </div>
          </div>

          {/* Main Content */}
          <div className="md:col-span-3 space-y-6">
            {activeTab === 'overview' && (
              <>
                {/* Stats Cards */}
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                  <div className="bg-white rounded-xl border p-6">
                    <div className="flex items-center justify-between mb-4">
                      <Package className="w-8 h-8 text-blue-600" />
                      <TrendingUp className="w-4 h-4 text-green-500" />
                    </div>
                    <div className="text-2xl font-bold">{stats.totalIcons}</div>
                    <div className="text-sm text-muted-foreground">Total Icons</div>
                  </div>
                  <div className="bg-white rounded-xl border p-6">
                    <div className="flex items-center justify-between mb-4">
                      <Download className="w-8 h-8 text-blue-600" />
                      <TrendingUp className="w-4 h-4 text-green-500" />
                    </div>
                    <div className="text-2xl font-bold">{stats.totalDownloads.toLocaleString()}</div>
                    <div className="text-sm text-muted-foreground">Downloads</div>
                  </div>
                  <div className="bg-white rounded-xl border p-6">
                    <div className="flex items-center justify-between mb-4">
                      <Eye className="w-8 h-8 text-blue-600" />
                      <TrendingUp className="w-4 h-4 text-green-500" />
                    </div>
                    <div className="text-2xl font-bold">{stats.totalViews.toLocaleString()}</div>
                    <div className="text-sm text-muted-foreground">Views</div>
                  </div>
                  <div className="bg-white rounded-xl border p-6">
                    <div className="flex items-center justify-between mb-4">
                      <Heart className="w-8 h-8 text-blue-600" />
                      <TrendingUp className="w-4 h-4 text-green-500" />
                    </div>
                    <div className="text-2xl font-bold">{stats.totalLikes}</div>
                    <div className="text-sm text-muted-foreground">Likes</div>
                  </div>
                </div>

                {/* Recent Icons */}
                <div className="bg-white rounded-xl border p-6">
                  <div className="flex justify-between items-center mb-6">
                    <h3 className="text-lg font-semibold">Recent Icons</h3>
                    <Button variant="outline" size="sm" onClick={() => setActiveTab('icons')}>
                      View All
                    </Button>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="w-full">
                      <thead>
                        <tr className="border-b">
                          <th className="text-left py-3 px-4 font-medium">Icon</th>
                          <th className="text-left py-3 px-4 font-medium">Downloads</th>
                          <th className="text-left py-3 px-4 font-medium">Views</th>
                          <th className="text-left py-3 px-4 font-medium">Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        {icons.slice(0, 4).map((icon) => (
                          <tr key={icon.id} className="border-b">
                            <td className="py-3 px-4">{icon.name}</td>
                            <td className="py-3 px-4">{icon.downloads}</td>
                            <td className="py-3 px-4">{icon.views}</td>
                            <td className="py-3 px-4">
                              <span className={`px-2 py-1 rounded-full text-xs ${
                                icon.status === 'active'
                                  ? 'bg-green-100 text-green-700'
                                  : 'bg-yellow-100 text-yellow-700'
                              }`}>
                                {icon.status}
                              </span>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </>
            )}

            {activeTab === 'icons' && (
              <div className="bg-white rounded-xl border p-6">
                <div className="flex justify-between items-center mb-6">
                  <h3 className="text-lg font-semibold">My Icons</h3>
                  <Button className="bg-blue-600 hover:bg-blue-700" onClick={() => setActiveTab('upload')}>
                    <Plus className="w-4 h-4 mr-2" />
                    Add New
                  </Button>
                </div>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                  {icons.map((icon) => (
                    <div key={icon.id} className="border rounded-lg p-4">
                      <div className="aspect-square bg-slate-100 rounded-lg mb-3 flex items-center justify-center">
                        <span className="text-slate-400">{icon.name}</span>
                      </div>
                      <div className="flex justify-between items-center">
                        <span className="font-medium text-sm truncate">{icon.name}</span>
                        <div className="flex gap-1">
                          <Button variant="ghost" size="icon" className="h-8 w-8">
                            <Edit className="h-3 w-3" />
                          </Button>
                          <Button variant="ghost" size="icon" className="h-8 w-8 text-red-500">
                            <Trash2 className="h-3 w-3" />
                          </Button>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {activeTab === 'upload' && (
              <div className="bg-white rounded-xl border p-6">
                <h3 className="text-lg font-semibold mb-6">Upload Icons</h3>
                <div className="border-2 border-dashed border-slate-300 rounded-xl p-12 text-center">
                  <Upload className="w-12 h-12 mx-auto mb-4 text-slate-400" />
                  <p className="text-lg font-medium mb-2">Drag and drop your SVG files here</p>
                  <p className="text-sm text-muted-foreground mb-4">or click to browse</p>
                  <Button variant="outline">Browse Files</Button>
                  <p className="text-xs text-muted-foreground mt-4">
                    Supports SVG files only. Max 1MB per file.
                  </p>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
